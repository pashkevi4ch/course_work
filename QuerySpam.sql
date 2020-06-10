Select id, username, DOR from sat_user
where datepart(dy, DOR) = datepart(dy, Convert(date, Getdate()))
