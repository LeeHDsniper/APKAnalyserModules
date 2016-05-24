.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;
.source "AdobeDesignLibraryItemsCellHolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ColorThemeCellHolder"
.end annotation


# instance fields
.field private _mainView:Landroid/widget/LinearLayout;

.field private _titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;-><init>(Landroid/view/View;)V

    .line 95
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_library_items_colortheme_container:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->_mainView:Landroid/widget/LinearLayout;

    .line 96
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_library_items_colortheme_text:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->_titleView:Landroid/widget/TextView;

    .line 97
    return-void
.end method


# virtual methods
.method public setRgbColors(Ljava/util/ArrayList;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "colors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->_mainView:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 101
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_f
    if-ge v2, v1, :cond_27

    .line 102
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->_mainView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 103
    .local v0, "childview":Landroid/view/View;
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 101
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 105
    .end local v0    # "childview":Landroid/view/View;
    :cond_27
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->_titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    return-void
.end method
