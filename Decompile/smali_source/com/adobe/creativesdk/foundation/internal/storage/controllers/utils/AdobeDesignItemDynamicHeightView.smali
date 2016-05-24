.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDesignItemDynamicHeightView;
.super Landroid/widget/RelativeLayout;
.source "AdobeDesignItemDynamicHeightView.java"


# instance fields
.field private mHeightRatio:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 13
    const-wide/high16 v0, 0x3ff0000000000000L

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDesignItemDynamicHeightView;->mHeightRatio:D

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    const-wide/high16 v0, 0x3ff0000000000000L

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDesignItemDynamicHeightView;->mHeightRatio:D

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 13
    const-wide/high16 v0, 0x3ff0000000000000L

    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDesignItemDynamicHeightView;->mHeightRatio:D

    .line 25
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 33
    invoke-super {p0, p1, p1}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 45
    return-void
.end method

.method public setHeightRatio(D)V
    .registers 4
    .param p1, "ratio"    # D

    .prologue
    .line 28
    iput-wide p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeDesignItemDynamicHeightView;->mHeightRatio:D

    .line 29
    return-void
.end method
