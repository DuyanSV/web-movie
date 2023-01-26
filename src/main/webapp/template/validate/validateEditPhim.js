document.getElementById('validateAddPhim').onclick = validateAddPhim;

function validateAddPhim() {
    var check = 0;
    check = checkName(check);
    check = checkDuration(check);
    check = checkQuality(check);
    check = checkDateAired(check);
    check = checkGenre(check);
    check = checkActor(check);
    if (check == 0) {
        document.getElementById('submitFormAddPhim').click();
    }
}

const checkName = (check) => {
    var namePhim = document.getElementsByName('name')[0].value;
    if (namePhim.trim().length == 0) {
        toastDanger("Lỗi", "Bạn không được để trống tên phim!")
        return check = check + 1;
    } else {
        return check = check;
    }
}

const checkDateAired = (check) => {
    var dateAired = document.getElementsByName('dateAired1')[0].value;
    if (dateAired.trim().length == 0) {
        toastDanger("Lỗi", "Bạn không được để trống ngày phát sóng!")
        return check = check + 1;
    } else {
        return check = check;
    }
}

const checkActor = (check) => {
    var actor = document.getElementsByName('actor')[0].value;
    if (actor.trim().length == 0) {
        toastDanger("Lỗi", "Bạn không được để trống diễn viên!")
        return check = check + 1;
    } else {
        return check = check;
    }
}

const checkGenre = (check) => {
    var genre = document.getElementsByName('theLoaiOut')[0].value;
    if (genre.trim().length == 0) {
        toastDanger("Lỗi", "Bạn không được để trống thể loại!")
        return check = check + 1;
    } else {
        return check = check;
    }
}

const checkDuration = (check) => {
    var duration = document.getElementsByName('duration')[0].value;
    if (duration.trim().length == 0) {
        toastDanger("Lỗi", "Bạn không được để trống thời lượng!")
        return check = check + 1;
    } else if (!/[0-9]{1,5}/.test(duration)) {
        toastDanger("Lỗi", "Thời lượng phải là số!")
        return check = check + 1;
    } else if (duration < 1) {
        toastDanger("Lỗi", "Thời lượng phải là số lớn hơn 0!")
        return check = check + 1;
    } else {
        return check = check;
    }
}

const checkQuality = (check) => {
    var quality = document.getElementsByName('quality')[0].value;
    if (quality.trim().length == 0) {
        toastDanger("Lỗi", "Bạn không được để trống số tập!")
        return check = check + 1;
    } else if (!/[0-9]{1,5}/.test(quality)) {
        toastDanger("Lỗi", "Số tập phải là số!")
        return check = check + 1;
    } else if (quality < 1) {
        toastDanger("Lỗi", "Số tập là số lớn hơn 0!")
        return check = check + 1;
    } else {
        return check = check;
    }
}
