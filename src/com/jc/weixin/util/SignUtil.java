package com.jc.weixin.util;

import java.security.MessageDigest;
import java.util.Arrays;

public class SignUtil {
	private static String token = "jiachao";

    public static boolean checkSignature(String signature,String timestamp,String nonce){
        boolean result = false;

        String[] array = new String[]{token,timestamp,nonce};
        Arrays.sort(array);

        String str = array[0]+array[1]+array[2];

        String sha1Str = null;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] digest = md.digest(str.getBytes());
            sha1Str = byte2Str(digest);
        }catch (Exception e){
            e.printStackTrace();
        }

        if(sha1Str!=null && sha1Str.equals(signature)){
            result = true;
        }

        return result;
    }

    public static String byte2Str(byte[] array) {
        StringBuffer sb = new StringBuffer();
        String shastr = "";
        for (int i=0;i<array.length;i++){
            shastr = Integer.toHexString(array[i] & 0XFF);
            if(shastr.length()<2){
                sb.append(0);
            }
            sb.append(shastr);
        }
        return sb.toString();
    }
}
