-- DELIMITER(구분자 역할) : "여기까지가 한 문장" 이라는 표시를 바꾸는 명령어.
-- MYSQL에서는 세미콜론을 만나면 문장이 끝난 줄 알고 자동 실행해버린다.
-- 그런데 프로시저 구문 안에도 세미콜론이 여러개 나올 수 있어서 다 읽기 전에 구문을 실행해 버리는 문제가 생김.
-- 그래서 잠시 구분자를 사용하여 세미콜론을 '//'로 바꿔주는 역할.

DELIMITER //
CREATE PROCEDURE `송금하기`() -- 아무 이름이나 상관없음. 심지어 송금하기() 처럼 한글 사용가능.
BEGIN
	START TRANSACTION;
        
        UPDATE ACCOUNTS SET BALANCE = BALANCE - 20000
        WHERE ACCOUNT_ID = 1 AND BALANCE >= 20000;

	IF ROW_COUNT() = 0 THEN ROLLBACK;
		SELECT '잔액부족' AS 결과;
        ELSE UPDATE ACCOUNTS SET BALANCE = BALANCE + 20000
		WHERE ACCOUNT_ID = 2;
                COMMIT;
             SELECT '송금완료' AS 결과;
        END IF;
END // 
-- 여기까지가 프로시저 끝. SP_TRANSFER() 프로시저를 생성.

DELIMITER ;
-- 다시 구분자를 세미콜론으로 변경.

-- 이 프로시저를 호출해서 사용.
CALL `송금하기`();
SELECT * FROM ACCOUNTS;