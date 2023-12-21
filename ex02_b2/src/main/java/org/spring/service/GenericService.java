package org.spring.service;

public interface GenericService<VO, K> {
	// PK 로 특정 튜플 반환
	public VO get(K key);
	//릴레이션에 VO 추가
	public void register(VO vo);
	// 튜플 수정 * 스프링에서는 파라미터를 객체로 설정하는 것이 좋다.
	public int modify(VO vo);
	// 튜플 삭제
	public int remove(K key);
}