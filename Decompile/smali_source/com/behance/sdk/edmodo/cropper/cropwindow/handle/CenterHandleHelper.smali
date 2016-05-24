.class Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/CenterHandleHelper;
.super Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;
.source "CenterHandleHelper.java"


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, v0, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/HandleHelper;-><init>(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;)V

    .line 29
    return-void
.end method


# virtual methods
.method updateCropWindow(FFFLandroid/graphics/Rect;F)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "targetAspectRatio"    # F
    .param p4, "imageRect"    # Landroid/graphics/Rect;
    .param p5, "snapRadius"    # F

    .prologue
    .line 82
    invoke-virtual {p0, p1, p2, p4, p5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/handle/CenterHandleHelper;->updateCropWindow(FFLandroid/graphics/Rect;F)V

    .line 83
    return-void
.end method

.method updateCropWindow(FFLandroid/graphics/Rect;F)V
    .registers 16
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "imageRect"    # Landroid/graphics/Rect;
    .param p4, "snapRadius"    # F

    .prologue
    const/high16 v10, 0x40000000

    .line 39
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    .line 40
    .local v3, "left":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    .line 41
    .local v8, "top":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v7

    .line 42
    .local v7, "right":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    .line 44
    .local v0, "bottom":F
    add-float v9, v3, v7

    div-float v1, v9, v10

    .line 45
    .local v1, "currentCenterX":F
    add-float v9, v8, v0

    div-float v2, v9, v10

    .line 47
    .local v2, "currentCenterY":F
    sub-float v5, p1, v1

    .line 48
    .local v5, "offsetX":F
    sub-float v6, p2, v2

    .line 51
    .local v6, "offsetY":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    .line 52
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v6}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    .line 53
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    .line 54
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v6}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    .line 57
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3, p4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutsideMargin(Landroid/graphics/Rect;F)Z

    move-result v9

    if-eqz v9, :cond_61

    .line 58
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->snapToRect(Landroid/graphics/Rect;)F

    move-result v4

    .line 59
    .local v4, "offset":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    .line 66
    .end local v4    # "offset":F
    :cond_4d
    :goto_4d
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3, p4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutsideMargin(Landroid/graphics/Rect;F)Z

    move-result v9

    if-eqz v9, :cond_75

    .line 67
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->snapToRect(Landroid/graphics/Rect;)F

    move-result v4

    .line 68
    .restart local v4    # "offset":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    .line 73
    .end local v4    # "offset":F
    :cond_60
    :goto_60
    return-void

    .line 60
    :cond_61
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3, p4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutsideMargin(Landroid/graphics/Rect;F)Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 61
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->snapToRect(Landroid/graphics/Rect;)F

    move-result v4

    .line 62
    .restart local v4    # "offset":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    goto :goto_4d

    .line 69
    .end local v4    # "offset":F
    :cond_75
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3, p4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutsideMargin(Landroid/graphics/Rect;F)Z

    move-result v9

    if-eqz v9, :cond_60

    .line 70
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, p3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->snapToRect(Landroid/graphics/Rect;)F

    move-result v4

    .line 71
    .restart local v4    # "offset":F
    sget-object v9, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v9, v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->offset(F)V

    goto :goto_60
.end method
