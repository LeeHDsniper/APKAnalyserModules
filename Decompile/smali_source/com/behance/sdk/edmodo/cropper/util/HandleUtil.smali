.class public Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;
.super Ljava/lang/Object;
.source "HandleUtil.java"


# direct methods
.method private static focusCenter()Z
    .registers 1

    .prologue
    .line 287
    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/cropwindow/CropOverlayView;->showGuidelines()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static getOffset(Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;FFFFFF)Landroid/util/Pair;
    .registers 15
    .param p0, "handle"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "left"    # F
    .param p4, "top"    # F
    .param p5, "right"    # F
    .param p6, "bottom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;",
            "FFFFFF)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .prologue
    const/high16 v7, 0x40000000

    .line 118
    if-nez p0, :cond_6

    .line 119
    const/4 v2, 0x0

    .line 169
    :goto_5
    return-object v2

    .line 122
    :cond_6
    const/4 v3, 0x0

    .line 123
    .local v3, "touchOffsetX":F
    const/4 v4, 0x0

    .line 126
    .local v4, "touchOffsetY":F
    sget-object v5, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$handle$Handle:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_52

    .line 168
    :goto_13
    new-instance v2, Landroid/util/Pair;

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 169
    .local v2, "result":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    goto :goto_5

    .line 129
    .end local v2    # "result":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Float;Ljava/lang/Float;>;"
    :pswitch_21
    sub-float v3, p3, p1

    .line 130
    sub-float v4, p4, p2

    .line 131
    goto :goto_13

    .line 133
    :pswitch_26
    sub-float v3, p5, p1

    .line 134
    sub-float v4, p4, p2

    .line 135
    goto :goto_13

    .line 137
    :pswitch_2b
    sub-float v3, p3, p1

    .line 138
    sub-float v4, p6, p2

    .line 139
    goto :goto_13

    .line 141
    :pswitch_30
    sub-float v3, p5, p1

    .line 142
    sub-float v4, p6, p2

    .line 143
    goto :goto_13

    .line 145
    :pswitch_35
    sub-float v3, p3, p1

    .line 146
    const/4 v4, 0x0

    .line 147
    goto :goto_13

    .line 149
    :pswitch_39
    const/4 v3, 0x0

    .line 150
    sub-float v4, p4, p2

    .line 151
    goto :goto_13

    .line 153
    :pswitch_3d
    sub-float v3, p5, p1

    .line 154
    const/4 v4, 0x0

    .line 155
    goto :goto_13

    .line 157
    :pswitch_41
    const/4 v3, 0x0

    .line 158
    sub-float v4, p6, p2

    .line 159
    goto :goto_13

    .line 161
    :pswitch_45
    add-float v5, p5, p3

    div-float v0, v5, v7

    .line 162
    .local v0, "centerX":F
    add-float v5, p4, p6

    div-float v1, v5, v7

    .line 163
    .local v1, "centerY":F
    sub-float v3, v0, p1

    .line 164
    sub-float v4, v1, p2

    goto :goto_13

    .line 126
    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_21
        :pswitch_26
        :pswitch_2b
        :pswitch_30
        :pswitch_35
        :pswitch_39
        :pswitch_3d
        :pswitch_41
        :pswitch_45
    .end packed-switch
.end method

.method public static getPressedHandle(FFFFFFF)Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;
    .registers 14
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "left"    # F
    .param p3, "top"    # F
    .param p4, "right"    # F
    .param p5, "bottom"    # F
    .param p6, "targetRadius"    # F

    .prologue
    .line 73
    const/4 v6, 0x0

    .line 77
    .local v6, "pressedHandle":Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;
    invoke-static {p0, p1, p2, p3, p6}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 78
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->TOP_LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    .line 100
    :cond_9
    :goto_9
    return-object v6

    .line 79
    :cond_a
    invoke-static {p0, p1, p4, p3, p6}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 80
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->TOP_RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    .line 81
    :cond_13
    invoke-static {p0, p1, p2, p5, p6}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 82
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    .line 83
    :cond_1c
    invoke-static {p0, p1, p4, p5, p6}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInCornerTargetZone(FFFFF)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 84
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    .line 85
    :cond_25
    invoke-static/range {p0 .. p5}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInCenterTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->focusCenter()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 86
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->CENTER:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    :cond_34
    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p4

    move v4, p3

    move v5, p6

    .line 87
    invoke-static/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInHorizontalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 88
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    :cond_43
    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p4

    move v4, p5

    move v5, p6

    .line 89
    invoke-static/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInHorizontalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 90
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    :cond_52
    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p5

    move v5, p6

    .line 91
    invoke-static/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInVerticalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_61

    .line 92
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    :cond_61
    move v0, p0

    move v1, p1

    move v2, p4

    move v3, p3

    move v4, p5

    move v5, p6

    .line 93
    invoke-static/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInVerticalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 94
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9

    .line 95
    :cond_70
    invoke-static/range {p0 .. p5}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->isInCenterTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-static {}, Lcom/behance/sdk/edmodo/cropper/util/HandleUtil;->focusCenter()Z

    move-result v0

    if-nez v0, :cond_9

    .line 96
    sget-object v6, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;->CENTER:Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/Handle;

    goto :goto_9
.end method

.method public static getTargetRadius(Landroid/content/Context;)F
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    const/4 v1, 0x1

    const/high16 v2, 0x41c00000

    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 46
    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    .line 49
    .local v0, "targetRadius":F
    return v0
.end method

.method private static isInCenterTargetZone(FFFFFF)Z
    .registers 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "left"    # F
    .param p3, "top"    # F
    .param p4, "right"    # F
    .param p5, "bottom"    # F

    .prologue
    .line 270
    cmpl-float v0, p0, p2

    if-lez v0, :cond_12

    cmpg-float v0, p0, p4

    if-gez v0, :cond_12

    cmpl-float v0, p1, p3

    if-lez v0, :cond_12

    cmpg-float v0, p1, p5

    if-gez v0, :cond_12

    .line 271
    const/4 v0, 0x1

    .line 273
    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static isInCornerTargetZone(FFFFF)Z
    .registers 6
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "handleX"    # F
    .param p3, "handleY"    # F
    .param p4, "targetRadius"    # F

    .prologue
    .line 192
    sub-float v0, p0, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p4

    if-gtz v0, :cond_16

    sub-float v0, p1, p3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p4

    if-gtz v0, :cond_16

    .line 193
    const/4 v0, 0x1

    .line 195
    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private static isInHorizontalTargetZone(FFFFFF)Z
    .registers 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "handleXStart"    # F
    .param p3, "handleXEnd"    # F
    .param p4, "handleY"    # F
    .param p5, "targetRadius"    # F

    .prologue
    .line 218
    cmpl-float v0, p0, p2

    if-lez v0, :cond_14

    cmpg-float v0, p0, p3

    if-gez v0, :cond_14

    sub-float v0, p1, p4

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p5

    if-gtz v0, :cond_14

    .line 219
    const/4 v0, 0x1

    .line 221
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private static isInVerticalTargetZone(FFFFFF)Z
    .registers 7
    .param p0, "x"    # F
    .param p1, "y"    # F
    .param p2, "handleX"    # F
    .param p3, "handleYStart"    # F
    .param p4, "handleYEnd"    # F
    .param p5, "targetRadius"    # F

    .prologue
    .line 244
    sub-float v0, p0, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p5

    if-gtz v0, :cond_14

    cmpl-float v0, p1, p3

    if-lez v0, :cond_14

    cmpg-float v0, p1, p4

    if-gez v0, :cond_14

    .line 245
    const/4 v0, 0x1

    .line 247
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
