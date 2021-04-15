/**
 * 
 */
function displayTime(regdate) {
	const timeValue = new Date(regdate);
	const milliSeconds = new Date() - timeValue;
	const seconds = milliSeconds / 1000;
	if (seconds < 60)
		return `방금 전`
	const minutes = seconds / 60
	if (minutes < 60)
		return Math.floor(minutes) + '분 전';
	const hours = minutes / 60
	if (hours < 24)
		return Math.floor(hours) + '시간 전';
	const days = hours / 24
	if (days < 7)
		return Math.floor(days) + '일 전';
	return timeValue.getFullYear() + '년 ' + timeValue.getMonth() + '월 '
			+ timeValue.getDate() + '일';
}


