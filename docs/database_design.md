# Database Design

## Study

연구 정보

| Field | Type | Description |
|---------|---------|---------|
| study_id | String | 연구 ID |
| study_name | String | 연구명 |
| sponsor | String | Sponsor |
| pi | String | 책임연구자 |
| status | String | 진행상태 |

---

## Subject

대상자 정보

| Field | Type | Description |
|---------|---------|---------|
| subject_id | String | 대상자 번호 |
| study_id | String | 연구 ID |
| screening_no | String | Screening 번호 |
| enrollment_date | Date | 등록일 |
| status | String | 상태 |

---

## Schedule

일정 정보

| Field | Type | Description |
|---------|---------|---------|
| schedule_id | String | 일정 ID |
| study_id | String | 연구 ID |
| subject_id | String | 대상자 번호 |
| type | String | 일정 종류 |
| title | String | 제목 |
| date | Date | 날짜 |
| time | Time | 시간 |
| memo | String | 메모 |

---

## IRB

IRB 일정

| Field | Type | Description |
|---------|---------|---------|
| irb_id | String | IRB ID |
| study_id | String | 연구 ID |
| approval_date | Date | 승인일 |
| expiry_date | Date | 만료일 |
| review_due_date | Date | 지속심의 마감일 |

---

## Notification

알림

| Field | Type | Description |
|---------|---------|---------|
| notification_id | String | 알림 ID |
| schedule_id | String | 일정 ID |
| notify_date | Date | 알림일 |
| status | String | 발송 여부 |
