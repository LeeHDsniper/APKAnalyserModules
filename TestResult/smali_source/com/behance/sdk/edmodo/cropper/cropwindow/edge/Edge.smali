.class public final enum Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
.super Ljava/lang/Enum;
.source "Edge.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

.field public static MIN_CROP_LENGTH_PX:I

.field public static final enum RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;


# instance fields
.field private mCoordinate:F


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "LEFT"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 27
    new-instance v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "TOP"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 28
    new-instance v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "RIGHT"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 29
    new-instance v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "BOTTOM"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 24
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v5

    sput-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->$VALUES:[Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    .line 36
    const/16 v0, 0x28

    sput v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 99
    return-void
.end method

.method private static adjustBottom(FLandroid/graphics/Rect;FF)F
    .registers 9
    .param p0, "y"    # F
    .param p1, "imageRect"    # Landroid/graphics/Rect;
    .param p2, "imageSnapRadius"    # F
    .param p3, "aspectRatio"    # F

    .prologue
    .line 524
    move v0, p0

    .line 526
    .local v0, "resultY":F
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, p0

    cmpg-float v3, v3, p2

    if-gez v3, :cond_d

    .line 527
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v3

    .line 545
    :goto_c
    return v0

    .line 531
    :cond_d
    const/high16 v2, -0x800000

    .line 532
    .local v2, "resultYVert":F
    const/high16 v1, -0x800000

    .line 535
    .local v1, "resultYHoriz":F
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    cmpg-float v3, p0, v3

    if-gtz v3, :cond_2a

    .line 536
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    add-float v2, v3, v4

    .line 539
    :cond_2a
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sub-float v3, p0, v3

    mul-float/2addr v3, p3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_46

    .line 540
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    div-float/2addr v4, p3

    add-float v1, v3, v4

    .line 542
    :cond_46
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_c
.end method

.method private static adjustLeft(FLandroid/graphics/Rect;FF)F
    .registers 9
    .param p0, "x"    # F
    .param p1, "imageRect"    # Landroid/graphics/Rect;
    .param p2, "imageSnapRadius"    # F
    .param p3, "aspectRatio"    # F

    .prologue
    .line 413
    move v0, p0

    .line 415
    .local v0, "resultX":F
    iget v3, p1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    sub-float v3, p0, v3

    cmpg-float v3, v3, p2

    if-gez v3, :cond_e

    .line 416
    iget v3, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v3

    .line 434
    :goto_d
    return v0

    .line 421
    :cond_e
    const/high16 v1, 0x7f800000

    .line 422
    .local v1, "resultXHoriz":F
    const/high16 v2, 0x7f800000

    .line 425
    .local v2, "resultXVert":F
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpl-float v3, p0, v3

    if-ltz v3, :cond_2b

    .line 426
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    sub-float v1, v3, v4

    .line 429
    :cond_2b
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sub-float/2addr v3, p0

    div-float/2addr v3, p3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_46

    .line 430
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    mul-float/2addr v4, p3

    sub-float v2, v3, v4

    .line 432
    :cond_46
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_d
.end method

.method private static adjustRight(FLandroid/graphics/Rect;FF)F
    .registers 9
    .param p0, "x"    # F
    .param p1, "imageRect"    # Landroid/graphics/Rect;
    .param p2, "imageSnapRadius"    # F
    .param p3, "aspectRatio"    # F

    .prologue
    .line 448
    move v0, p0

    .line 451
    .local v0, "resultX":F
    iget v3, p1, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    sub-float/2addr v3, p0

    cmpg-float v3, v3, p2

    if-gez v3, :cond_d

    .line 452
    iget v3, p1, Landroid/graphics/Rect;->right:I

    int-to-float v0, v3

    .line 473
    :goto_c
    return v0

    .line 457
    :cond_d
    const/high16 v1, -0x800000

    .line 458
    .local v1, "resultXHoriz":F
    const/high16 v2, -0x800000

    .line 461
    .local v2, "resultXVert":F
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    cmpg-float v3, p0, v3

    if-gtz v3, :cond_2a

    .line 462
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    add-float v1, v3, v4

    .line 465
    :cond_2a
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sub-float v3, p0, v3

    div-float/2addr v3, p3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_46

    .line 466
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    mul-float/2addr v4, p3

    add-float v2, v3, v4

    .line 469
    :cond_46
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    goto :goto_c
.end method

.method private static adjustTop(FLandroid/graphics/Rect;FF)F
    .registers 9
    .param p0, "y"    # F
    .param p1, "imageRect"    # Landroid/graphics/Rect;
    .param p2, "imageSnapRadius"    # F
    .param p3, "aspectRatio"    # F

    .prologue
    .line 487
    move v0, p0

    .line 489
    .local v0, "resultY":F
    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    sub-float v3, p0, v3

    cmpg-float v3, v3, p2

    if-gez v3, :cond_e

    .line 490
    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v3

    .line 510
    :goto_d
    return v0

    .line 495
    :cond_e
    const/high16 v2, 0x7f800000

    .line 496
    .local v2, "resultYVert":F
    const/high16 v1, 0x7f800000

    .line 499
    .local v1, "resultYHoriz":F
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpl-float v3, p0, v3

    if-ltz v3, :cond_2b

    .line 500
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    sub-float v1, v3, v4

    .line 503
    :cond_2b
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sub-float/2addr v3, p0

    mul-float/2addr v3, p3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_46

    .line 504
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->MIN_CROP_LENGTH_PX:I

    int-to-float v4, v4

    div-float/2addr v4, p3

    sub-float v2, v3, v4

    .line 506
    :cond_46
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    goto :goto_d
.end method

.method public static getHeight()F
    .registers 2

    .prologue
    .line 343
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method public static getWidth()F
    .registers 2

    .prologue
    .line 336
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method private isOutOfBounds(FFFFLandroid/graphics/Rect;)Z
    .registers 7
    .param p1, "top"    # F
    .param p2, "left"    # F
    .param p3, "bottom"    # F
    .param p4, "right"    # F
    .param p5, "imageRect"    # Landroid/graphics/Rect;

    .prologue
    .line 245
    iget v0, p5, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_1c

    iget v0, p5, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-ltz v0, :cond_1c

    iget v0, p5, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    cmpl-float v0, p3, v0

    if-gtz v0, :cond_1c

    iget v0, p5, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    cmpl-float v0, p4, v0

    if-lez v0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->$VALUES:[Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, [Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    return-object v0
.end method


# virtual methods
.method public adjustCoordinate(F)V
    .registers 8
    .param p1, "aspectRatio"    # F

    .prologue
    .line 113
    sget-object v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    .line 114
    .local v1, "left":F
    sget-object v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    .line 115
    .local v3, "top":F
    sget-object v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    .line 116
    .local v2, "right":F
    sget-object v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v4}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    .line 118
    .local v0, "bottom":F
    sget-object v4, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_40

    .line 132
    :goto_23
    return-void

    .line 120
    :pswitch_24
    invoke-static {v3, v2, v0, p1}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateLeft(FFFF)F

    move-result v4

    iput v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_23

    .line 123
    :pswitch_2b
    invoke-static {v1, v2, v0, p1}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateTop(FFFF)F

    move-result v4

    iput v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_23

    .line 126
    :pswitch_32
    invoke-static {v1, v3, v0, p1}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateRight(FFFF)F

    move-result v4

    iput v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_23

    .line 129
    :pswitch_39
    invoke-static {v1, v3, v2, p1}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateBottom(FFFF)F

    move-result v4

    iput v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_23

    .line 118
    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_24
        :pswitch_2b
        :pswitch_32
        :pswitch_39
    .end packed-switch
.end method

.method public adjustCoordinate(FFLandroid/graphics/Rect;FF)V
    .registers 8
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "imageRect"    # Landroid/graphics/Rect;
    .param p4, "imageSnapRadius"    # F
    .param p5, "aspectRatio"    # F

    .prologue
    .line 87
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_28

    .line 101
    :goto_b
    return-void

    .line 89
    :pswitch_c
    invoke-static {p1, p3, p4, p5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustLeft(FLandroid/graphics/Rect;FF)F

    move-result v0

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_b

    .line 92
    :pswitch_13
    invoke-static {p2, p3, p4, p5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustTop(FLandroid/graphics/Rect;FF)F

    move-result v0

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_b

    .line 95
    :pswitch_1a
    invoke-static {p1, p3, p4, p5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustRight(FLandroid/graphics/Rect;FF)F

    move-result v0

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_b

    .line 98
    :pswitch_21
    invoke-static {p2, p3, p4, p5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->adjustBottom(FLandroid/graphics/Rect;FF)F

    move-result v0

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_b

    .line 87
    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_c
        :pswitch_13
        :pswitch_1a
        :pswitch_21
    .end packed-switch
.end method

.method public getCoordinate()F
    .registers 2

    .prologue
    .line 72
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    return v0
.end method

.method public isNewRectangleOutOfBounds(Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;Landroid/graphics/Rect;F)Z
    .registers 11
    .param p1, "edge"    # Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;
    .param p2, "imageRect"    # Landroid/graphics/Rect;
    .param p3, "aspectRatio"    # F

    .prologue
    .line 146
    invoke-virtual {p1, p2}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->snapOffset(Landroid/graphics/Rect;)F

    move-result v6

    .line 148
    .local v6, "offset":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v5

    aget v0, v0, v5

    packed-switch v0, :pswitch_data_136

    .line 231
    :cond_f
    const/4 v0, 0x1

    :goto_10
    return v0

    .line 150
    :pswitch_11
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 151
    iget v0, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v0

    .line 152
    .local v1, "top":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v3, v0, v6

    .line 153
    .local v3, "bottom":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    .line 154
    .local v4, "right":F
    invoke-static {v1, v4, v3, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateLeft(FFFF)F

    move-result v2

    .local v2, "left":F
    move-object v0, p0

    move-object v5, p2

    .line 156
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto :goto_10

    .line 159
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :cond_35
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 160
    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v0

    .line 161
    .restart local v3    # "bottom":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v1, v0, v6

    .line 162
    .restart local v1    # "top":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    .line 163
    .restart local v4    # "right":F
    invoke-static {v1, v4, v3, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateLeft(FFFF)F

    move-result v2

    .restart local v2    # "left":F
    move-object v0, p0

    move-object v5, p2

    .line 165
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto :goto_10

    .line 170
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :pswitch_59
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 171
    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v0

    .line 172
    .restart local v2    # "left":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v4, v0, v6

    .line 173
    .restart local v4    # "right":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    .line 174
    .restart local v3    # "bottom":F
    invoke-static {v2, v4, v3, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateTop(FFFF)F

    move-result v1

    .restart local v1    # "top":F
    move-object v0, p0

    move-object v5, p2

    .line 176
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto :goto_10

    .line 179
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :cond_7d
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 180
    iget v0, p2, Landroid/graphics/Rect;->right:I

    int-to-float v4, v0

    .line 181
    .restart local v4    # "right":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v2, v0, v6

    .line 182
    .restart local v2    # "left":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    .line 183
    .restart local v3    # "bottom":F
    invoke-static {v2, v4, v3, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateTop(FFFF)F

    move-result v1

    .restart local v1    # "top":F
    move-object v0, p0

    move-object v5, p2

    .line 185
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto/16 :goto_10

    .line 190
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :pswitch_a2
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c7

    .line 191
    iget v0, p2, Landroid/graphics/Rect;->top:I

    int-to-float v1, v0

    .line 192
    .restart local v1    # "top":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v3, v0, v6

    .line 193
    .restart local v3    # "bottom":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    .line 194
    .restart local v2    # "left":F
    invoke-static {v2, v1, v3, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateRight(FFFF)F

    move-result v4

    .restart local v4    # "right":F
    move-object v0, p0

    move-object v5, p2

    .line 196
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto/16 :goto_10

    .line 199
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :cond_c7
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 200
    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v0

    .line 201
    .restart local v3    # "bottom":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v1, v0, v6

    .line 202
    .restart local v1    # "top":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    .line 203
    .restart local v2    # "left":F
    invoke-static {v2, v1, v3, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateRight(FFFF)F

    move-result v4

    .restart local v4    # "right":F
    move-object v0, p0

    move-object v5, p2

    .line 205
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto/16 :goto_10

    .line 211
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :pswitch_ec
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_111

    .line 212
    iget v0, p2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v0

    .line 213
    .restart local v2    # "left":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v4, v0, v6

    .line 214
    .restart local v4    # "right":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    .line 215
    .restart local v1    # "top":F
    invoke-static {v2, v1, v4, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateBottom(FFFF)F

    move-result v3

    .restart local v3    # "bottom":F
    move-object v0, p0

    move-object v5, p2

    .line 217
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto/16 :goto_10

    .line 220
    .end local v1    # "top":F
    .end local v2    # "left":F
    .end local v3    # "bottom":F
    .end local v4    # "right":F
    :cond_111
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 221
    iget v0, p2, Landroid/graphics/Rect;->right:I

    int-to-float v4, v0

    .line 222
    .restart local v4    # "right":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sub-float v2, v0, v6

    .line 223
    .restart local v2    # "left":F
    sget-object v0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    .line 224
    .restart local v1    # "top":F
    invoke-static {v2, v1, v4, p3}, Lcom/behance/sdk/edmodo/cropper/util/AspectRatioUtil;->calculateBottom(FFFF)F

    move-result v3

    .restart local v3    # "bottom":F
    move-object v0, p0

    move-object v5, p2

    .line 226
    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/Rect;)Z

    move-result v0

    goto/16 :goto_10

    .line 148
    :pswitch_data_136
    .packed-switch 0x1
        :pswitch_11
        :pswitch_59
        :pswitch_a2
        :pswitch_ec
    .end packed-switch
.end method

.method public isOutsideMargin(Landroid/graphics/Rect;F)Z
    .registers 8
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "margin"    # F

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 354
    const/4 v0, 0x0

    .line 356
    .local v0, "result":Z
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_48

    .line 370
    :goto_e
    return v0

    .line 358
    :pswitch_f
    iget v3, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    iget v4, p1, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpg-float v3, v3, p2

    if-gez v3, :cond_1b

    move v0, v1

    .line 359
    :goto_1a
    goto :goto_e

    :cond_1b
    move v0, v2

    .line 358
    goto :goto_1a

    .line 361
    :pswitch_1d
    iget v3, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    iget v4, p1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    cmpg-float v3, v3, p2

    if-gez v3, :cond_29

    move v0, v1

    .line 362
    :goto_28
    goto :goto_e

    :cond_29
    move v0, v2

    .line 361
    goto :goto_28

    .line 364
    :pswitch_2b
    iget v3, p1, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    iget v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sub-float/2addr v3, v4

    cmpg-float v3, v3, p2

    if-gez v3, :cond_37

    move v0, v1

    .line 365
    :goto_36
    goto :goto_e

    :cond_37
    move v0, v2

    .line 364
    goto :goto_36

    .line 367
    :pswitch_39
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    iget v4, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sub-float/2addr v3, v4

    cmpg-float v3, v3, p2

    if-gez v3, :cond_45

    move v0, v1

    :goto_44
    goto :goto_e

    :cond_45
    move v0, v2

    goto :goto_44

    .line 356
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_f
        :pswitch_1d
        :pswitch_2b
        :pswitch_39
    .end packed-switch
.end method

.method public offset(F)V
    .registers 3
    .param p1, "distance"    # F

    .prologue
    .line 62
    iget v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    .line 63
    return-void
.end method

.method public setCoordinate(F)V
    .registers 2
    .param p1, "coordinate"    # F

    .prologue
    .line 52
    iput p1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    .line 53
    return-void
.end method

.method public snapOffset(Landroid/graphics/Rect;)F
    .registers 7
    .param p1, "imageRect"    # Landroid/graphics/Rect;

    .prologue
    .line 287
    iget v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    .line 288
    .local v2, "oldCoordinate":F
    move v0, v2

    .line 290
    .local v0, "newCoordinate":F
    sget-object v3, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_22

    .line 305
    :goto_e
    sub-float v1, v0, v2

    .line 306
    .local v1, "offset":F
    return v1

    .line 292
    .end local v1    # "offset":F
    :pswitch_11
    iget v3, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v3

    .line 293
    goto :goto_e

    .line 295
    :pswitch_15
    iget v3, p1, Landroid/graphics/Rect;->top:I

    int-to-float v0, v3

    .line 296
    goto :goto_e

    .line 298
    :pswitch_19
    iget v3, p1, Landroid/graphics/Rect;->right:I

    int-to-float v0, v3

    .line 299
    goto :goto_e

    .line 301
    :pswitch_1d
    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v3

    goto :goto_e

    .line 290
    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_11
        :pswitch_15
        :pswitch_19
        :pswitch_1d
    .end packed-switch
.end method

.method public snapToRect(Landroid/graphics/Rect;)F
    .registers 6
    .param p1, "imageRect"    # Landroid/graphics/Rect;

    .prologue
    .line 257
    iget v1, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    .line 259
    .local v1, "oldCoordinate":F
    sget-object v2, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$behance$sdk$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_2a

    .line 274
    :goto_d
    iget v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sub-float v0, v2, v1

    .line 275
    .local v0, "offset":F
    return v0

    .line 261
    .end local v0    # "offset":F
    :pswitch_12
    iget v2, p1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_d

    .line 264
    :pswitch_18
    iget v2, p1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_d

    .line 267
    :pswitch_1e
    iget v2, p1, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_d

    .line 270
    :pswitch_24
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iput v2, p0, Lcom/behance/sdk/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_d

    .line 259
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_12
        :pswitch_18
        :pswitch_1e
        :pswitch_24
    .end packed-switch
.end method
