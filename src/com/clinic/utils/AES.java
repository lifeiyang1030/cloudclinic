package com.clinic.utils;

import javax.crypto.*;
import javax.crypto.spec.*;

/**
 * @description 提供AES加密和解密
 * @version 20140822
 */
public class AES {
	
	/**
	 * @description AES解密
	 * @param strSource：需要解密字符串
	 * @param strKey：解密密钥
	 * @return
	 * @throws Exception
	 */
	public static String decrypt(String strSource, String strKey) throws Exception {
		try {
			// 判断Key是否正确
			if (strKey == null) {
				System.out.print("Key为空null");
				return null;
			}
			// 判断Key是否为16位
			if (strKey.length() != 16) {
				System.out.print("Key长度不是16位");
				return null;
			}
			byte[] raw = strKey.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
			byte[] encrypted1 = hexToByte(strSource);
			try {
				byte[] original = cipher.doFinal(encrypted1);
				String originalString = new String(original);
				return originalString;
			} catch (Exception e) {
				System.out.println(e.toString());
				return null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex);
		}
	}

	/**
	 * @description AES加密
	 * @param strSource：需要加密字符串
	 * @param strKey：加密密钥
	 * @return
	 * @throws Exception
	 */
	public static String encrypt(String strSource, String strKey) throws Exception {
		if (strKey == null) {
			System.out.print("Key为空null");
			return null;
		}
		// 判断Key是否为16位
		if (strKey.length() != 16) {
			System.out.print("Key长度不是16位");
			return null;
		}
		byte[] raw = strKey.getBytes("ASCII");
		SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(strSource.getBytes());
		return byteToHex(encrypted).toLowerCase();
	}

	private static byte[] hexToByte(String strhex) throws Exception {
		if (strhex == null) {
			return null;
		}
		int l = strhex.length();
		if (l % 2 == 1) {
			return null;
		}
		byte[] b = new byte[l / 2];
		for (int i = 0; i != l / 2; i++) {
			b[i] = (byte) Integer.parseInt(strhex.substring(i * 2, i * 2 + 2), 16);
		}
		return b;
	}

	private static String byteToHex(byte[] b) throws Exception {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
		}
		return hs.toUpperCase();
	}
	
//	public static void main(String[] args) throws Exception {
//		/*
//		 * 加密用的Key 可以用26个字母和数字组成，最好不要用保留字符，虽然不会错，至于怎么裁决，个人看情况而定
//		 */
//		String cKey = "1234567890abcDEF";
//		// 需要加密的字串
//		String cSrc = "我是一个2b";
//		// 加密
//		long lStart = System.currentTimeMillis();
//		String enString = AES.Encrypt(cSrc, cKey);
//		System.out.println("加密后的字串是：" + enString);
//		long lUseTime = System.currentTimeMillis() - lStart;
//		System.out.println("加密耗时：" + lUseTime + "毫秒");
//		// 解密
//		lStart = System.currentTimeMillis();
//		String DeString = AES.Decrypt(enString, cKey);
//		System.out.println("解密后的字串是：" + DeString);
//		lUseTime = System.currentTimeMillis() - lStart;
//		System.out.println("解密耗时：" + lUseTime + "毫秒");
//	}
}