.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;
.super Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;
.source "AdobeWaterFallLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;
    }
.end annotation


# instance fields
.field private _clientSectionsDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;

.field private _singleSpanSize:I


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "gcmOfSpans"    # I

    .prologue
    .line 26
    sget-object v0, Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;->VERTICAL:Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager;-><init>(Lorg/lucasr/twowayview/TwoWayLayoutManager$Orientation;II)V

    .line 16
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->_singleSpanSize:I

    .line 27
    return-void
.end method

.method private getSpanForSectionItem(IZ)I
    .registers 8
    .param p1, "itemSection"    # I
    .param p2, "isHeader"    # Z

    .prologue
    .line 42
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->_clientSectionsDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;

    invoke-interface {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;->getGCMOfSpans()I

    move-result v0

    .line 43
    .local v0, "gcmOfSpans":I
    if-eqz p2, :cond_9

    .line 48
    .end local v0    # "gcmOfSpans":I
    :goto_8
    return v0

    .line 45
    .restart local v0    # "gcmOfSpans":I
    :cond_9
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->getNumColumns()I

    move-result v1

    .line 46
    .local v1, "numCols":I
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->_clientSectionsDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;

    invoke-interface {v4, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;->getNumColumnsInSection(I)I

    move-result v2

    .line 47
    .local v2, "numberOfColumnsInSection":I
    div-int v3, v0, v2

    .local v3, "span":I
    move v0, v3

    .line 48
    goto :goto_8
.end method


# virtual methods
.method public getLayoutParamsForItem(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;IZ)Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    .registers 6
    .param p1, "existingParams"    # Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    .param p2, "itemSection"    # I
    .param p3, "isHeader"    # Z

    .prologue
    .line 53
    new-instance v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 55
    .local v0, "staggeredGridParams":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    invoke-direct {p0, p2, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->getSpanForSectionItem(IZ)I

    move-result v1

    iput v1, v0, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;->span:I

    .line 57
    return-object v0
.end method

.method public setClientSectionsDelegate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;)V
    .registers 2
    .param p1, "delegate"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->_clientSectionsDelegate:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager$SectionDetailsDelegate;

    .line 68
    return-void
.end method
