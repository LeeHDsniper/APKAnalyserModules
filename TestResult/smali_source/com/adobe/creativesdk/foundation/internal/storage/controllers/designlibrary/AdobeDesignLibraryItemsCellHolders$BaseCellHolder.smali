.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeDesignLibraryItemsCellHolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseCellHolder"
.end annotation


# instance fields
.field private _libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 29
    return-void
.end method


# virtual methods
.method public getLibraryItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;->_libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    return-object v0
.end method

.method public setDisabled(Z)V
    .registers 4
    .param p1, "disable"    # Z

    .prologue
    .line 40
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;->itemView:Landroid/view/View;

    if-eqz p1, :cond_b

    const v0, 0x3e99999a

    :goto_7
    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 41
    return-void

    .line 40
    :cond_b
    const/high16 v0, 0x3f800000

    goto :goto_7
.end method

.method public setLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
    .registers 2
    .param p1, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;->_libraryItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .line 33
    return-void
.end method
