/**
 * 上传图片
 * Created by micheal on 16/1/21.
 */
var uploadImg = {
    opts: undefined,
    initUpload: function (opts) {
        opts = $.extend({
            id: 'fileIds',
            name: 'fileIds',
            thumbWidth: 104,
            imgMaxWidth: 500,
            limitAmount: 8,
            uploadUrl: undefined,
            deleteUrl: undefined
        }, opts);
        var _this = this;
        _this.opts = opts;

        $("#" + _this.opts.id).localResizeIMG({
            width: opts.imgMaxWidth,
            quality: 0.9,
            success: function (result) {
                if (opts.limitAmount <= $("img").length) {
                    wxcommon.message("最多上传" + opts.limitAmount + "张图片");
                    return;
                }
                wxcommon.showProgress("上传中");
                $.ajax({
                    url: opts.uploadUrl,
                    type: 'POST',
                    data: {file: result.clearBase64},
                    dataType: 'text',
                    error: function () {
                        wxcommon.message('上传图片失败');
                        wxcommon.colseProgress();
                    },
                    success: function (tmpFileId) {
                        wxcommon.colseProgress();
                        if (tmpFileId) {
                            _this.createPreviewImg($("#" + _this.opts.id), result.base64, tmpFileId);
                        } else {
                            wxcommon.message('上传图片失败');
                        }
                    }
                });
            }
        });
    },
    createPreviewImg: function ($file, imgBase64, tmpFileId) {
        var _this = this;
        var $showImgContainer = $file.parent();
        var $imgContainer = '<li class="code_' + _this.opts.name + '">' +
                            '<ins onclick="uploadImg.deleteImg(this,\'' + _this.opts.name +
                                '\',null, \'' + tmpFileId + '\')"></ins><img src="'+ imgBase64 + '" style="width: '+
                            _this.opts.thumbWidth +'px; height: '+ _this.opts.thumbWidth +'px;"></li>';

        $showImgContainer.before($imgContainer);
        $("#inputForm").append('<input type="hidden" id="' + tmpFileId +
            '" name="' + _this.opts.name + '" value="' + tmpFileId + '" />');

        _this.decideShowUploadBtn();
    },
    deleteImg: function (e, name, imgId, tmpFileId) {
        var _this = this;
        var $e = $(e);
        wxcommon.confirm("亲，确定要删除图片吗？", function(){
            var isTempFile = wxcommon.isEmpty(imgId);
            _this._deleteImg(isTempFile ? tmpFileId : imgId, isTempFile, function(){
                $e.parents("li").remove();
                _this.decideShowUploadBtn();
                if(isTempFile){
                    $("#" + tmpFileId).remove();
                }
            });
        });
    },
    _deleteImg: function (id, isTempFile, callback) {
        var _this = this;
        $.ajax({
            url: _this.opts.deleteUrl,
            data: {
                id: id,
                isTempFile: isTempFile
            },
            type: 'post',
            dataType: 'text',
            success: function (result) {
                if (1 == result) {
                    callback();
                } else {
                    wxcommon.message("删除图片失败");
                }
            },
            error: function () {
                wxcommon.message("删除图片失败");
            }
        });
    },
    checkImageSize: function(){
        var _this = this;
        var imageSize = $("li.code_" + _this.opts.name).length;
        return imageSize > 0 && imageSize <= _this.opts.limitAmount
    },
    decideShowUploadBtn: function () {
        var _this = this;
        var $upload = $("#" + _this.opts.id).parent();
        if (_this.opts.limitAmount > $("li.code_" + _this.opts.name).length) {
            $upload.show();
        } else {
            $upload.hide();
        }
    }
};
