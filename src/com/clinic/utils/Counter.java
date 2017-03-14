package com.clinic.utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class Counter {

	/** 首次错误时间 */
	private Date startTime;
	/** 超过指定错误次数后，锁定多长时间，单位为秒 */
	private long lockTimeLong;
	/** 错误计数 */
	private Integer count;
	/** 是否锁定 */
	private boolean isLock = false;

	/** 超过指定错误次数后锁定时间(单位为秒) */
	private final long LOGIN_ERROR_LOCK_TIME = 10 * 60;
	/** 连续错误的时间间隔(单位为秒) */
	private final long LOGIN_ERROR_INTERVAL_TIME = 60;

	public Counter() {
		startTime = new Date();
		lockTimeLong = LOGIN_ERROR_LOCK_TIME;
		count = 0;
	}

	public void checkTime(Date inTime) {
		clearMap();
		// 计算出相差多少秒
		long rowe = (inTime.getTime() - startTime.getTime()) / 1000;
		if (rowe >= 0 && rowe <= LOGIN_ERROR_INTERVAL_TIME) {
			count++;
		} else if (!isLock) {
			startTime = inTime;
		}
	}

	/**
	 * 
	 * @description 检查map中的数据是否有超时的，如果有则remove
	 * @author Jxl
	 * @data 2014年5月15日
	 * @time 下午2:55:03
	 * 
	 */
	private void clearMap() {
		HashMap<String, Counter> hashMap = new HashMap<String, Counter>();
		hashMap.putAll(CounterMap.hash);
		if (hashMap != null && hashMap.size() > 0) {
			Iterator<Entry<String, Counter>> iter = hashMap.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry<String, Counter> entry = iter.next();
				Counter checkCount = entry.getValue();
				// 计算出相差多少秒
				long rowe = (new Date().getTime() - checkCount.getStartTime().getTime()) / 1000;
				if (rowe >= lockTimeLong) {
					CounterMap.hash.remove(entry.getKey());
				}
			}
			hashMap.clear();
			hashMap = null;
		}
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public boolean isLock() {
		return isLock;
	}

	public void setLock(boolean isLock) {
		this.isLock = isLock;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public long getLockTimeLong() {
		return lockTimeLong;
	}

	public void setLockTimeLong(long lockTimeLong) {
		this.lockTimeLong = lockTimeLong;
	}

}
