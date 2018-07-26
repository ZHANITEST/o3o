//
// o3o runtime / IComponent.d
//   - 게임루프 안에서 업데이트 해야할 공통 컴포넌트 정의
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.IComponent;

import derelict.sdl2.sdl; // SDL2 레벨

/**
 * IGeneralComponent 인터페이스
 *   - 게임루프 안에서 사용할 일반 컴포넌트 규격
 *   - ~는 일괄적으로 update함수가 반드시 있어야 한다
 */
interface IGeneralComponent{
    void update();
}

/**
 * IEventComponent 인터페이스
 *   - 게임루프 안에서 사용할 이벤트 컴포넌트 규격
 *   -  ~는 일괄적으로 update함수를 가지며, SDL_Event인수를 받아야 한다
 *   - SDL2의 폴링방식 때문에 함수 서명에 ref 키워드 대신 내부처리에서 & 사용
 */
interface IEventComponent{
    void update(SDL_Event e);
}