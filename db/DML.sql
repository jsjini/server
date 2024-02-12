use dev;

CREATE TABLE `t_board_board` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(1000) NOT NULL,
	`writer` VARCHAR(1000) NOT NULL,
	`content` VARCHAR(1000) NULL,
	`created_date` datetime NOT NULL,
    `updated_date` datetime NULL default current_timestamp,
	PRIMARY KEY(`no`)
);

CREATE TABLE `t_comment_board` (
	`no` INT NOT NULL AUTO_INCREMENT,
	`writer` VARCHAR(1000) NOT NULL,
	`content` VARCHAR(1000) NULL,
	`created_date` datetime NOT NULL,
    `updated_date` datetime NULL default current_timestamp,
    `bno` INT NOT NULL,
    PRIMARY KEY(`no`),
	CONSTRAINT FOREIGN KEY (bno) REFERENCES t_board_board(no)
);

INSERT INTO `t_board_board` (`no`, `title`, `writer`, `content`, `created_date`, `updated_date`)
VALUES 
        (100, '오픈AI 패권 다툼의 승자와 패자', 'Martin Bayer', '가장 중요한 AI 스타트업의 권력이 재편되고 있다. 오픈AI 드라마의 승자와 패자를 정리해 본다.', '2023-11-16','2023-11-17' ),
        (101, '랜섬웨어 탐지 및 대응을 위한 5가지 팁', '브라이언 B. 브라운 이사', '랜섬웨어로부터 조직을 보호하기 위해 조직 구성원 모두가 명심해야 할 5가지 핵심 사항은 다음과 같다.', '2023-11-17','2023-11-17' ),
        (102, '새로운 아이디어는 어떻게 성공하는가?', '최형광', '하늘 아래 새로운 것은 없다고 하지만, 세상은 늘 새로움을 찾는다. 새로움은 차별화를 만드는 포인트다.', '2023-11-17','2023-11-17' ),
        (103, '문화 구축이 성장 동력', 'Pat Brans', '클라우드 중심 문화를 만드는 5가지 요소', '2023-11-18','2023-11-19' );
		
INSERT INTO `t_comment_board` (`no`, `writer`, `content`, `created_date`, `updated_date`, `bno`)
VALUES 
        (1000, 'Lucas Mearian', '챗GPT는 지난 12개월 동안 AI 분야를 송두리째 흔들었다. 그리고 더 넓게는 기술의 지형을 근본적으로 변화시켰다.', '2023-11-16','2023-11-16', 100),
        (1001, '리탄', '챗GPT로 대표되는 생성형 AI에 대해한 우려의 목소리도 높았다', '2023-11-16','2023-11-17', 100),
        (1002, '체크포인트', 'AI·핵티비즘 및 무기화된 딥페이크 폭풍의 실체 드러나', '2023-11-17','2023-11-17', 101),
        (1003, 'Stephanie Overby', '클라우드로 전환 결정이 중요한 시점은 이미 지났다. 이제 얼마나 잘 진행되고 있는지가 중요하다.', '2023-11-19','2023-11-19', 103);

COMMIT;