.class public Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;
.super Landroid/view/View$DragShadowBuilder;
.source "StickersPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/StickersPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CustomDragShadowBuilder"
.end annotation


# instance fields
.field private final mScaleFactor:F


# direct methods
.method public constructor <init>(Landroid/view/View;F)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "scaleFactor"    # F

    .prologue
    .line 1450
    invoke-direct {p0, p1}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    .line 1451
    iput p2, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->mScaleFactor:F

    .line 1452
    return-void
.end method


# virtual methods
.method public onDrawShadow(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1465
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->mScaleFactor:F

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->mScaleFactor:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 1466
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 1467
    return-void
.end method

.method public onProvideShadowMetrics(Landroid/graphics/Point;Landroid/graphics/Point;)V
    .registers 8
    .param p1, "shadowSize"    # Landroid/graphics/Point;
    .param p2, "shadowTouchPoint"    # Landroid/graphics/Point;

    .prologue
    .line 1456
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->getView()Landroid/view/View;

    move-result-object v1

    .line 1457
    .local v1, "v":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->mScaleFactor:F

    mul-float/2addr v3, v4

    float-to-int v2, v3

    .line 1458
    .local v2, "width":I
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/StickersPanel$CustomDragShadowBuilder;->mScaleFactor:F

    mul-float/2addr v3, v4

    float-to-int v0, v3

    .line 1459
    .local v0, "height":I
    invoke-virtual {p1, v2, v0}, Landroid/graphics/Point;->set(II)V

    .line 1460
    div-int/lit8 v3, v2, 0x2

    div-int/lit8 v4, v0, 0x2

    invoke-virtual {p2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 1461
    return-void
.end method
