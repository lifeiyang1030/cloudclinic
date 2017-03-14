package com.clinic.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

/**
 * 
 * @description 文件夹遍历
 * 
 * @author Jxl
 * @date 2015年3月24日
 * @time 上午10:32:12
 *
 */
public class DirTraversal {

	/**
	 * 
	 * @description 获取指定文件夹下所有文件
	 * 
	 * @param strPath 文件夹路径
	 * @return
	 */
	public static LinkedList<File> listLinkedFiles(String strPath) {
		LinkedList<File> listDir = new LinkedList<File>();
		LinkedList<File> listFiles = new LinkedList<File>();
		File dir = new File(strPath);
		File file[] = dir.listFiles();
		for (int i = 0; i < file.length; i++) {
			if (file[i].isDirectory()) {
				listDir.add(file[i]);
			} else {
				listFiles.add(file[i]);
				//System.out.println(file[i].getAbsolutePath());
			}
		}
		File tmp;
		while (!listDir.isEmpty()) {
			tmp = listDir.removeFirst();
			if (tmp.isDirectory()) {
				file = tmp.listFiles();
				if (file == null) {
					continue;
				}
				for (int i = 0; i < file.length; i++) {
					if (file[i].isDirectory()) {
						listDir.add(file[i]);
					} else {
						listFiles.add(file[i]);
						//System.out.println(file[i].getAbsolutePath());
					}

				}
			} else {
				listFiles.add(tmp);
				//System.out.println(tmp.getAbsolutePath());
			}
		}
		listDir.clear();
		listDir = null;
		return listFiles;
	}

	/**
	 * 
	 * @description 获取指定文件夹下所有文件
	 * 
	 * @param strPath 文件夹路径
	 * @return
	 */
	public static ArrayList<File> listAllFiles(String strPath) {
		return refreshFileList(strPath, null);
	}

	/**
	 * 
	 * @description 获取指定文件夹下 指定后缀名的文件
	 * 
	 * @param strPath
	 * @param suffix
	 * @return
	 */
	public static ArrayList<File> listSpecificFiles(String strPath, String suffix) {
		return refreshFileList(strPath, suffix);
	}
	
	/**
	 * 
	 * @description 获取指定文件夹下 指定后缀名的文件
	 * 
	 * @param strPath
	 * @param suffix
	 * @return
	 */
	public static Map<String, File> mapSpecificFiles(String strPath, String suffix) {
		ArrayList<File> files = refreshFileList(strPath, suffix);
		Map<String, File> mapFiles = new HashMap<String, File>();
		for (File file : files) {
			mapFiles.put(file.getName().toLowerCase(), file);
		}
		return mapFiles;
	}

	private static ArrayList<File> refreshFileList(String strPath, String suffix) {
		ArrayList<File> filelist = new ArrayList<File>();
		File dir = new File(strPath);
		File[] files = dir.listFiles();

		if (files == null) {
			return null;
		}
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				refreshFileList(files[i].getAbsolutePath(), suffix);
			} else {
				if (suffix != null && !suffix.trim().equals("")) {
					if (files[i].getName().toLowerCase().endsWith(suffix)) {
						filelist.add(files[i]);
					}
				} else {
					filelist.add(files[i]);
				}

			}
		}
		return filelist;
	}

	public static void main(String[] args) {
		for (File file : listSpecificFiles("E:\\Repositories\\集症一期\\db\\txn-protorevs", "rev")) {
			System.out.println(file.getAbsolutePath());
			System.out.println(file.getName());
		}
	}
}
