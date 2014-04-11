//
//  LightSnowDayTime.cpp
//  WeatherEffectsDemo
//
//  Created by liu wei on 4/10/14.
//
//

#include "LightSnowDayTime.h"
#import "WeatherEffectsUtils.h"
#import "SimpleAudioEngine.h"

USING_NS_CC;

CCScene* LightSnowDayTime::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    LightSnowDayTime *layer = LightSnowDayTime::create();
    layer->setTag(LAYER_TAG);
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool LightSnowDayTime::init()
{
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    
    CCSize size = CCDirector::sharedDirector()->getWinSize(); // 屏幕大小
    
    CCSprite *bgSprite = CCSprite::create("ld_bg_snow_day_time.jpg");//
    float bgSpritespx = bgSprite->getTextureRect().getMaxX();
    float bgSpritespy = bgSprite->getTextureRect().getMaxY();
    // position the sprite on the center of the screen
    bgSprite->setPosition(ccp(0,size.height/2));
    bgSprite->setScaleX(size.width/bgSpritespx*2);
    bgSprite->setScaleY(size.height/bgSpritespy);
    // add the sprite as a child to this layer
    this->addChild(bgSprite, 0);
    
    //背景移动
    CCFiniteTimeAction* actionMove = CCMoveTo::create( (float)size.width/3,ccp(size.width, size.height/2) );
    CCFiniteTimeAction* actionMoveDone = CCCallFuncN::create( this,callfuncN_selector(LightSnowDayTime::bgSpriteMoveFinished));
    bgSprite->runAction( CCSequence::create(actionMove,actionMoveDone, NULL) );
    
    float scale = size.width / 320.0f;//缩放比率 因为我是按照320*480设计的粒子效果
    
    CCParticleSystemQuad *snowEffect = CCParticleSystemQuad::create("light_snow.plist");
    snowEffect->setPosition(ccp(size.width/2-30, size.height));
    //rainEffect->setAnchorPoint(Point(0,0));
    snowEffect->setScale(scale);
    
    this->addChild(snowEffect);
    
    return true;
}

void LightSnowDayTime::bgSpriteMoveFinished()
{
    WeatherEffectsUtils::doLightSnowDayTime(isPlaySound);
}

void LightSnowDayTime::onExit()
{
    if (isPlaySound) {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();
        CocosDenshion::SimpleAudioEngine::sharedEngine()->stopAllEffects();
    }
}

void LightSnowDayTime::onEnterTransitionDidFinish()
{
    if (isPlaySound) {
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(
                                                                              "windy.mp3", true);
    }
}
