/*
 * Copyright (C) 2020 ArrowOS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.display;

import android.content.SharedPreferences;

import org.lineageos.settings.utils.FileUtils;

public final class KcalUtils {

    public static final String KCAL_ENABLE_NODE = "/sys/devices/platform/kcal_ctrl.0/kcal_enable";

    public static final String KCAL_FILE = "/sys/devices/platform/kcal_ctrl.0/";
    public static final String KCAL_RGB_NODE = KCAL_FILE + "kcal";
    public static final String KCAL_SATURATION_NODE = KCAL_FILE + "kcal_sat";
    public static final String KCAL_VALUE_NODE = KCAL_FILE + "kcal_val";
    public static final String KCAL_CONTRAST_NODE = KCAL_FILE + "kcal_cont";

    private static final String[] COLOR_PROFILE_SETTINGS = {"red", "green", "blue", "saturation", "value", "contrast"};

    private static final int[][] COLOR_PROFILES_VALUES = {
            // R, G, B, saturation, value, contrast
            {256, 256, 256, 255, 255, 255},  //Default
            {225, 245, 256, 264, 255, 255},  //Version 1
            {250, 250, 235, 251, 240, 260},  //Version 2
            {240, 240, 240, 257, 255, 255},  //Version 3
            {256, 250, 251, 290, 264, 260},  //Triluminous
            {250, 250, 256, 284, 245, 264},  //Deep black and white
            {250, 250, 256, 257, 245, 264},  //Deep natural
            {236, 248, 256, 274, 251, 258},  //Cool amoled
            {256, 256, 256, 289, 242, 264},  //Extreme amoled
            {253, 246, 243, 274, 251, 258},  //Warm amoled
            {226, 215, 256, 264, 247, 260},  //Hybrid mamba
            {225, 225, 237, 277, 250, 264},  //Deep amoled
            {230, 232, 255, 277, 273, 243},  //Cold amoled
            {237, 235, 255, 265, 253, 255},  //Clean deep
            {245, 245, 256, 273, 265, 255},  //Shamshung
            {240, 256, 256, 290, 242, 264},  //Nature
            {230, 240, 255, 285, 240, 270},  //Shamshung cold
            {217, 215, 255, 265, 253, 250},  //Cold as ice
            {237, 239, 256, 270, 247, 275},  //Deep saturated
            {230, 232, 255, 274, 247, 268}}; //Black AF

    // Write the given value to the given position on the KCAL node
    // position 0 is the full node, so the function will write the value to the node without following a pattern
    // position 1 is RED
    // position 2 is GREEN
    // position 3 is BLUE
    // RED GREEN BLUE is the format of the data that will be printed to the node

    public static void writeConfigToNode(String node, int position, int value) {
        String mDefaultRgbFormat = "R G B";
        String mNewNodeData = "";

        switch(position) {
            case 0:
                mNewNodeData = String.valueOf(value);
                break;
            case 1:
                mNewNodeData = mDefaultRgbFormat.replace("R", String.valueOf(value));
                break;
            case 2:
                mNewNodeData = mDefaultRgbFormat.replace("G", String.valueOf(value));
                break;
            case 3:
                mNewNodeData = mDefaultRgbFormat.replace("B", String.valueOf(value));
                break;
        }

         mNewNodeData = mNewNodeData
            .replace("R", getNodeData(KCAL_RGB_NODE, 1))
            .replace("G", getNodeData(KCAL_RGB_NODE, 2))
            .replace("B", getNodeData(KCAL_RGB_NODE, 3));

        FileUtils.writeLine(node, mNewNodeData);
    }

    // Get the value of the given position
    // 0 is the full node value
    // 1, 2 and 3 will return the first, second and third string divided by an space in the specified node
    public static String getNodeData(String node, int position) {
        String mNodeData = FileUtils.readOneLine(node);
        switch(position) {
            case 0:
                return mNodeData;
            case 1:
            case 2:
            case 3:
                return mNodeData.split(" ")[position - 1];
            default:
                return null;
        }
    }

    public static void writeCurrentSettings(SharedPreferences sharedPrefs) {
        FileUtils.writeLine(KcalUtils.KCAL_ENABLE_NODE,
            sharedPrefs.getBoolean("kcal_enable", false) ? "1" : "0");

        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 1, sharedPrefs.getInt("red_slider", 256));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 2, sharedPrefs.getInt("green_slider", 256));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_RGB_NODE, 3, sharedPrefs.getInt("blue_slider", 256));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_SATURATION_NODE, 0, sharedPrefs.getInt("saturation_slider", 255));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_VALUE_NODE, 0, sharedPrefs.getInt("value_slider", 255));
        KcalUtils.writeConfigToNode(KcalUtils.KCAL_CONTRAST_NODE, 0, sharedPrefs.getInt("contrast_slider", 255));
    }

    public static boolean isKcalSupported() {
        return FileUtils.fileExists(KCAL_ENABLE_NODE);
    }

    public static int getMin(String key) {
        switch (key) {
            case "saturation_slider":
            case "value_slider":
            case "contrast_slider":
                return 224;
            default:
                return 1;
        }
    }

    public static void setColorProfile(int profileIndex, SharedPreferences sharedPrefs) {
        try {
            int[] profileSettings = COLOR_PROFILES_VALUES[profileIndex];
            if (profileSettings.length != COLOR_PROFILE_SETTINGS.length) {
                return;
            }

            for (int i = 0; i < profileSettings.length; i++) {
                if (profileSettings[i] != -1) {
                    sharedPrefs.edit().putInt(COLOR_PROFILE_SETTINGS[i] + "_slider", profileSettings[i]).apply();
                }
            }

            writeCurrentSettings(sharedPrefs);
        } catch (ArrayIndexOutOfBoundsException e) {
            e.printStackTrace();
        }
    }
}