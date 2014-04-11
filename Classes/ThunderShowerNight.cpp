//
//  ThinderShowerNight.cpp
//  WeatherEffectsDemo
//
//  Created by liu wei on 4/10/14.
//
//

#include "ThunderShowerNight.h"
#import "WeatherEffectsUtils.h"
#import "SimpleAudioEngine.h"

USING_NS_CC;

CCScene* ThunderShowerNight::scene()
{
    // 'scene' is an autorelease object
    CCScene *scene = CCScene::create();
    
    // 'layer' is an autorelease object
    ThunderShowerNight *layer = ThunderShowerNight::create();
    
    // add layer as a child to scene
    scene->addChild(layer);
    
    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool ThunderShowerNight::init()
{
    // 1. super init first
    if ( !CCLayer::init() )
    {
        return false;
    }
    
    CCSize size = CCDirector::sharedDirector()->getWinSize(); // 屏幕大小
    
    CCSprite *bgSprite = CCSprite::create("ld_bg_rain_night.jpg");
    float bgSpritespx = bgSprite->getTextureRect().getMaxX();
    float bgSpritespy = bgSprite->getTextureRect().getMaxY();
    // position the sprite on the center of the screen
    bgSprite->setPosition(ccp(0,size.height/2));
    bgSprite->setScaleX(size.width/bgSpritespx*2);
    bgSprite->setScaleY(size.height/bgSpritespy);
    // add the sprite as a child to this layer
    this->addChild(bgSprite, 0);
    
    //背景移动
    CCFiniteTimeAction* actionMove = CCMoveTo::create( (float)size.width/4,ccp(size.width, size.height/2) );
    CCFiniteTimeAction* actionMoveDone = CCCallFuncN::create( this,callfuncN_selector(ThunderShowerNight::bgSpriteMoveFinished));
    bgSprite->runAction( CCSequence::create(actionMove,actionMoveDone, NULL) );
    
    float scale = size.width / 320.0f;//缩放比率 因为我是按照320*480设计的粒子效果
    
    CCParticleSystemQuad *rainEffect = CCParticleSystemQuad::create("heavy_rain.plist");
    //emitter1->setStartColor(ccc4f(1,0,0,1));
    //emitter1->setBlendAdditive(false);
    
    rainEffect->setPosition(ccp(size.width/2-30, size.height));
    //rainEffect->setAnchorPoint(Point(0,0));
    rainEffect->setScale(scale);
    
    this->addChild(rainEffect);
    
    CCParticleSystemQuad *cloudEffect = CCParticleSystemQuad::create("clouds.plist");
    cloudEffect->setPosition(ccp(0,size.height+65));
    cloudEffect->setScale(scale);
    this->addChild(cloudEffect);
    
    
    CCParticleSystemQuad *light1Effect = CCParticleSystemQuad::create("light1.plist");
    light1Effect->setPosition(ccp(size.width/2,size.height));
    light1Effect->setScale(scale);
    light1Effect->setVisible(false);
    this->addChild(light1Effect);
    
    CCActionInterval *light1DelayTime = CCDelayTime::create(10);
    CCActionInstant *light1callFunc = CCCallFuncN::create(this, callfuncN_selector(ThunderShowerNight::lightPreShow));
    light1Effect->runAction(CCRepeatForever::create(CCSequence::create(light1DelayTime,light1callFunc,NULL)));
    
    CCParticleSystemQuad *light2Effect = CCParticleSystemQuad::create("light2.plist");
    light2Effect->setPosition(ccp(size.width/2,size.height));
    light2Effect->setScale(scale);
    light2Effect->setVisible(false);
    this->addChild(light2Effect);
    
    CCActionInterval *light2DelayTime = CCDelayTime::create(10);
    CCActionInstant *light2callFunc = CCCallFuncN::create(this, callfuncN_selector(ThunderShowerNight::lightPreShow));
    light2Effect->runAction(CCRepeatForever::create(CCSequence::create(light2DelayTime,light2callFunc,NULL)));
    
    

    
    return true;
}

void ThunderShowerNight::lightPreShow(CCNode *node)
{
    CCLOG("lightPreShow");
    CCParticleSystemQuad *light1Effect = (CCParticleSystemQuad*)node;
    bool lightIsVisible = light1Effect->isVisible();
    if (lightIsVisible) {
        light1Effect ->setVisible(false);
    }else{
        light1Effect ->setVisible(true);
        CocosDenshion::SimpleAudioEngine::sharedEngine()->playEffect(
                                                                     "thunder.wav");
    }
}

void ThunderShowerNight::bgSpriteMoveFinished()
{
    WeatherEffectsUtils::doThunderShowerNight();
}

void ThunderShowerNight::onExit()
{
    CocosDenshion::SimpleAudioEngine::sharedEngine()->stopBackgroundMusic();
    CocosDenshion::SimpleAudioEngine::sharedEngine()->stopAllEffects();
}

void ThunderShowerNight::onEnterTransitionDidFinish()
{
    CocosDenshion::SimpleAudioEngine::sharedEngine()->playBackgroundMusic(
                                                                          "rain.wav", true);
}
