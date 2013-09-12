/*
    This file is part of Cyclos (www.cyclos.org).
    A project of the Social Trade Organisation (www.socialtrade.org).

    Cyclos is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Cyclos is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Cyclos; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

 */
package com.puremoneysystems.poc.utils;


import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

import java.lang.Process;
import java.lang.Runtime;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.io.File;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.IOException;

import org.opentransactions.otapi.OTAPI_Basic;
import org.opentransactions.otjavalib.Tools;




/**
 * The OT Manager implementation
 * 
 * @author chris
 */
public class OTManagerImpl implements OTManager, InitializingBean, DisposableBean {

    private String lastTestResult = new String("nothing yet");
    private boolean otapiLoaded = false;

    @Override
    public void afterPropertiesSet() throws Exception {
		this.appendPathToRuntime("/usr/local/lib");
		System.loadLibrary("otapi-java");
		
		
		OTAPI_Basic.AppStartup();
		OTAPI_Basic.Init();
        
		otapiLoaded = OTAPI_Basic.LoadWallet();
		if(!otapiLoaded){
			OTAPI_Basic.AppShutdown();
			throw new RuntimeException("Failed to load the current wallet.");
		}		
    }

    @Override
    public void destroy() throws Exception {
    	if(otapiLoaded){
    		OTAPI_Basic.AppShutdown();
    		otapiLoaded = false;
    	}
    }

	@Override
	public String getServerState() {		
		try{		
			

            
            
            OTAPI_Basic.Output(0, "OTAPI test");
            OTAPI_Basic.AppShutdown();
			
			
		}catch(Exception e){
			 this.lastTestResult = e.toString();
			 e.printStackTrace();
		}

		return this.lastTestResult;
	}

	@Override
	public String getLastTestResult() {
		return this.lastTestResult;
	}
	
	
	
	
	
	
	
	
	
	
	private Collection<String> appendPathToRuntime(final String strPath) throws IllegalAccessException, NoSuchFieldException {
        Set<String> pathSet = new HashSet<String>();


        Field field = ClassLoader.class.getDeclaredField("usr_paths");
        field.setAccessible(true);

        pathSet.addAll(Arrays.asList((String[]) field.get(null)));
        pathSet.addAll(Arrays.asList(strPath.split(File.pathSeparator)));

        if (pathSet.contains(".")) {
            pathSet.remove(".");
        }
        if (pathSet.contains("")) {
            pathSet.remove("");
        }
        if (pathSet.contains(" ")) {
            pathSet.remove(" ");
        }
        if (pathSet.contains(File.pathSeparator)) {
            pathSet.remove(File.pathSeparator);
        }

        // now we have just a set of all the paths (including the new one).

        StringBuilder pathsString = new StringBuilder();
        Iterator<String> setIterator = pathSet.iterator();
        while (setIterator.hasNext()) {
            String next = setIterator.next();
            //System.out.println("Path:  " + next);
            pathsString.append(next);
            if (setIterator.hasNext()) {
                pathsString.append(File.pathSeparator);
            }
        }

        field.set(null, pathSet.toArray(new String[0]));
        System.setProperty("java.library.path", pathsString.toString());
        //System.out.println("Utility.addDirToRuntime: Setting java.library.path: " + pathsString.toString());

        return pathSet;
    }

	
	
	
	
	
	
	
	
	
	
	
	

}
