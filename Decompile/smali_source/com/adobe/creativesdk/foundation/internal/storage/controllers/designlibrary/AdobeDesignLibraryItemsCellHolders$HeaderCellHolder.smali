.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;
.source "AdobeDesignLibraryItemsCellHolders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeaderCellHolder"
.end annotation


# instance fields
.field private _titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$BaseCellHolder;-><init>(Landroid/view/View;)V

    .line 60
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_library_items_header_text_id:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;->_titleView:Landroid/widget/TextView;

    .line 61
    return-void
.end method


# virtual methods
.method public setTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;->_titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    return-void
.end method
