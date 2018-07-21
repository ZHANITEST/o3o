//
// o3o runtime / IComponent.d
//   - 게임루프 안에서 업데이트 해야할 공통 컴포넌트 정의
//   - 작성자: ZHANITEST(github.com/zhanitest/o3o.git)
//

module o3o.IComponent;

/**
 * IComponent 인터페이스
 *   - 게임루프 안에서 사용할 컴포넌트 규격
 */
interface IComponent{
    // ~는 일괄적으로 update함수가 반드시 있어야 한다
    void update();
}