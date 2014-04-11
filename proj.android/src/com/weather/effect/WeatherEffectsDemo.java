/****************************************************************************
Copyright (c) 2010-2011 cocos2d-x.org

http://www.cocos2d-x.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
package com.weather.effect;

import org.cocos2dx.lib.Cocos2dxActivity;
import org.cocos2dx.lib.Cocos2dxGLSurfaceView;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;

public class WeatherEffectsDemo extends Cocos2dxActivity{
	
	private FrameLayout linearWeatherBg;
	
	Cocos2dxGLSurfaceView glSurfaceView;
	
    protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);	
		
		
		View myView = LayoutInflater.from(this).inflate(R.layout.activity_main, null);
		
		myView.findViewById(R.id.lybt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.lyws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.dybt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.dyws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.xybt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.xyws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.qtbt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.qtws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.duoybt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.duoyws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.dfbt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.dfws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.dxbt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.dxws).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.xxbt).setOnClickListener(onBtnClick);
		myView.findViewById(R.id.xxws).setOnClickListener(onBtnClick);
		
		FrameLayout fl = (FrameLayout)glSurfaceView.getParent();
		fl.addView(myView);
	}

    
    private View.OnClickListener onBtnClick = new View.OnClickListener() {
		
		@Override
		public void onClick(View v) {
			final int id = v.getId();
			Cocos2dxGLSurfaceView.getInstance().queueEvent(new Runnable() {
	               @Override
	               public void run() {
	            	   switch (id) {
	       			case R.id.lybt:
	       				CallWeatherEffects.doThunderShowerDayTime(true);
	       				break;
	       			case R.id.lyws:
	       				CallWeatherEffects.doThunderShowerNight(true);
	       				break;
	       			case R.id.dybt:
	       				CallWeatherEffects.doHeavyRainDayTime(true);
	       				break;
	       			case R.id.dyws:
	       				CallWeatherEffects.doHeavyRainNight(true);
	       				break;
	       			case R.id.xybt:
	       				CallWeatherEffects.doLightRainDayTime(true);
	       				break;
	       			case R.id.xyws:
	       				CallWeatherEffects.doLightRainNight(true);
	       				break;
	       			case R.id.qtbt:
	       				CallWeatherEffects.doSunnyDayTime(true);
	       				break;
	       			case R.id.qtws:
	       				CallWeatherEffects.doSunnyNight(true);
	       				break;
	       			case R.id.duoybt:
	       				CallWeatherEffects.doCloudyDayTime(true);
	       				break;
	       			case R.id.duoyws:
	       				CallWeatherEffects.doCloudyNight(true);
	       				break;
	       			case R.id.dfbt:
	       				CallWeatherEffects.doWindyDayTime(true);
	       				break;
	       			case R.id.dfws:
	       				CallWeatherEffects.doWindyNight(true);
	       				break;
	       			case R.id.dxbt:
	       				CallWeatherEffects.doHeavySnowDayTime(true);
	       				break;
	       			case R.id.dxws:
	       				CallWeatherEffects.doHeavySnowNight(true);
	       				break;
	       			case R.id.xxbt:
	       				CallWeatherEffects.doLightSnowDayTime(true);
	       				break;
	       			case R.id.xxws:
	       				CallWeatherEffects.doLightSnowNight(true);
	       				break;

	       			default:
	       				break;
	       			}
	               }
	           });
			
		}
	};
    
    public Cocos2dxGLSurfaceView onCreateView() {
    	glSurfaceView = new Cocos2dxGLSurfaceView(this);
    	// WeatherEffectsDemo should create stencil buffer
    	glSurfaceView.setEGLConfigChooser(5, 6, 5, 0, 16, 8);
    	
    	return glSurfaceView;
    }

    static {
        System.loadLibrary("cocos2dcpp");
    }     
}
