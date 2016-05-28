.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LibraryItemsSectionAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;
    }
.end annotation


# instance fields
.field final SECTION_VIEW_TYPES:I

.field private _sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

.field private _sectionNumToLibrarySection:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 528
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    .line 529
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Landroid/content/Context;)V

    .line 523
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->SECTION_VIEW_TYPES:I

    .line 530
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    .line 531
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    .line 532
    return-void
.end method

.method private bindColorItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 7
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "itemPos"    # I

    .prologue
    .line 696
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;

    .local v1, "colorItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;
    move-object v0, p1

    .line 697
    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;

    .line 698
    .local v0, "colorCellHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z
    invoke-static {v3, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v2

    .line 699
    .local v2, "shouldDisableItem":Z
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;->setLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    .line 700
    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;->setDisabled(Z)V

    .line 701
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->color()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;->setColor(I)V

    .line 702
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorNameOrHexValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;->setColorRgbText(Ljava/lang/String;)V

    .line 703
    return-void
.end method

.method private bindColorThemeItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 7
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "itemPos"    # I

    .prologue
    .line 774
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;

    .local v0, "colorThemeItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;
    move-object v1, p1

    .line 775
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;

    .line 776
    .local v1, "colorthemeCellHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z
    invoke-static {v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v2

    .line 777
    .local v2, "shouldDisableItem":Z
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->setLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    .line 778
    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->setDisabled(Z)V

    .line 779
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->getRGBColors()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->setRgbColors(Ljava/util/ArrayList;)V

    .line 780
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->nameOrIdForDisplay()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;->setTitle(Ljava/lang/String;)V

    .line 781
    return-void
.end method

.method private bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V
    .registers 9
    .param p1, "librarySection"    # I
    .param p2, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p4, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    .line 749
    move-object v1, p2

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;

    .line 750
    .local v1, "imageCollectionCellHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;
    invoke-virtual {v1, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->setLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    .line 751
    invoke-virtual {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->nameOrIdForDisplay()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->setTitle(Ljava/lang/String;)V

    .line 754
    invoke-direct {p0, p1, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getImageAspectRatioOfLibraryItem(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->setImageHeightRatio(D)V

    .line 755
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->shouldDisableLibraryItem(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z
    invoke-static {v2, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$1000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;->setDisabled(Z)V

    .line 756
    if-eqz p3, :cond_2b

    .line 758
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;

    invoke-direct {v0, p0, v1, p4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    .line 767
    .local v0, "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->THUMBNAIL_SIZED_RENDITION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-static {p3, v2, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeLibraryItemUtils;->getImageRendition(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;)V

    .line 770
    .end local v0    # "completionCallback":Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;
    :cond_2b
    return-void
.end method

.method private getImageAspectRatioOfLibraryItem(ILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)D
    .registers 12
    .param p1, "librarySection"    # I
    .param p2, "libraryItem"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .prologue
    const/4 v8, 0x0

    .line 708
    const-wide/high16 v2, 0x3ff0000000000000L

    .line 709
    .local v2, "imageAspectRatio":D
    packed-switch p1, :pswitch_data_9e

    .line 742
    :cond_6
    :goto_6
    return-wide v2

    :pswitch_7
    move-object v4, p2

    .line 711
    check-cast v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .line 712
    .local v4, "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImageWidth()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImageHeight()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    .line 713
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImageHeight()F

    move-result v7

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImageWidth()F

    move-result v8

    div-float/2addr v7, v8

    float-to-double v2, v7

    goto :goto_6

    .end local v4    # "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    :pswitch_25
    move-object v0, p2

    .line 717
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    .line 718
    .local v0, "brushItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRenditionWidth()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRenditionHeight()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    .line 719
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRenditionHeight()F

    move-result v7

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRenditionWidth()F

    move-result v8

    div-float/2addr v7, v8

    float-to-double v2, v7

    goto :goto_6

    .end local v0    # "brushItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
    :pswitch_43
    move-object v1, p2

    .line 724
    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    .line 725
    .local v1, "characterStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRenditionWidth()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRenditionHeight()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    .line 726
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRenditionHeight()F

    move-result v7

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRenditionWidth()F

    move-result v8

    div-float/2addr v7, v8

    float-to-double v2, v7

    goto :goto_6

    .end local v1    # "characterStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
    :pswitch_61
    move-object v5, p2

    .line 730
    check-cast v5, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    .line 731
    .local v5, "layoutStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRenditionWidth()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRenditionHeight()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    .line 732
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRenditionHeight()F

    move-result v7

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRenditionWidth()F

    move-result v8

    div-float/2addr v7, v8

    float-to-double v2, v7

    goto :goto_6

    .end local v5    # "layoutStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;
    :pswitch_7f
    move-object v6, p2

    .line 736
    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    .line 737
    .local v6, "look":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRenditionWidth()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRenditionHeight()F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    .line 738
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRenditionHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRenditionWidth()F

    move-result v8

    div-float/2addr v7, v8

    float-to-double v2, v7

    goto/16 :goto_6

    .line 709
    :pswitch_data_9e
    .packed-switch 0x2
        :pswitch_25
        :pswitch_7
        :pswitch_43
        :pswitch_61
        :pswitch_7f
    .end packed-switch
.end method

.method private getLibrarySectionFromRawSectionNum(I)I
    .registers 3
    .param p1, "sectionNum"    # I

    .prologue
    .line 610
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private initializeSectionColumnDetails()V
    .registers 4

    .prologue
    .line 899
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    if-eqz v0, :cond_5

    .line 907
    :goto_4
    return-void

    .line 902
    :cond_5
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    .line 903
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_items_default_columns:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->defaultColumns:I

    .line 904
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_items_color_section_columns:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->colorSectionColumns:I

    .line 905
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_items_colortheme_section_columns:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->colorThemeSectionColumns:I

    .line 906
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$integer;->adobe_library_items_image_section_columns:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->imageSectionColumns:I

    goto :goto_4
.end method


# virtual methods
.method protected calculateItemLayoutProperties(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;)V
    .registers 9
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "itemPositionData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;

    .prologue
    .line 568
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 569
    .local v0, "itemView":Landroid/view/View;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_waterFallLayoutManager:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;

    move-result-object v3

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    iget v4, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->sectionNum:I

    iget-boolean v5, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->isSectionHeader:Z

    invoke-virtual {v3, v2, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/AdobeWaterFallLayoutManager;->getLayoutParamsForItem(Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;IZ)Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object v1

    .line 571
    .local v1, "newLayoutParams":Lorg/lucasr/twowayview/widget/StaggeredGridLayoutManager$LayoutParams;
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 572
    return-void
.end method

.method protected createViewHolderOfType(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 10
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "typeView"    # I

    .prologue
    const/4 v6, 0x0

    .line 544
    const/4 v4, 0x7

    if-ne p2, v4, :cond_16

    .line 545
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_items_headercell:I

    invoke-virtual {v4, v5, p1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 546
    .local v2, "headercellView":Landroid/view/View;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;

    invoke-direct {v4, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;-><init>(Landroid/view/View;)V

    .line 562
    .end local v2    # "headercellView":Landroid/view/View;
    :goto_15
    return-object v4

    .line 548
    :cond_16
    if-nez p2, :cond_2a

    .line 549
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_items_colorcell:I

    invoke-virtual {v4, v5, p1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 550
    .local v0, "colorcellView":Landroid/view/View;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;

    invoke-direct {v4, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorCellHolder;-><init>(Landroid/view/View;)V

    goto :goto_15

    .line 552
    .end local v0    # "colorcellView":Landroid/view/View;
    :cond_2a
    const/4 v4, 0x1

    if-ne p2, v4, :cond_3f

    .line 553
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_items_colorthemecell:I

    invoke-virtual {v4, v5, p1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 554
    .local v1, "colorthemecellView":Landroid/view/View;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;

    invoke-direct {v4, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ColorThemeCellHolder;-><init>(Landroid/view/View;)V

    goto :goto_15

    .line 556
    .end local v1    # "colorthemecellView":Landroid/view/View;
    :cond_3f
    const/4 v4, 0x2

    if-eq p2, v4, :cond_4e

    const/4 v4, 0x4

    if-eq p2, v4, :cond_4e

    const/4 v4, 0x3

    if-eq p2, v4, :cond_4e

    const/4 v4, 0x5

    if-eq p2, v4, :cond_4e

    const/4 v4, 0x6

    if-ne p2, v4, :cond_60

    .line 558
    :cond_4e
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_items_imagecollectioncell:I

    invoke-virtual {v4, v5, p1, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 559
    .local v3, "imagecollectioncellView":Landroid/view/View;
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;

    invoke-direct {v4, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$ImageCollectionCellHolder;-><init>(Landroid/view/View;)V

    goto :goto_15

    .line 562
    .end local v3    # "imagecollectioncellView":Landroid/view/View;
    :cond_60
    const/4 v4, 0x0

    goto :goto_15
.end method

.method public getNumColumnsInSection(I)I
    .registers 5
    .param p1, "rawsection"    # I

    .prologue
    .line 910
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getLibrarySectionFromRawSectionNum(I)I

    move-result v1

    .line 911
    .local v1, "section":I
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->initializeSectionColumnDetails()V

    .line 912
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget v0, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->defaultColumns:I

    .line 913
    .local v0, "numColumns":I
    packed-switch v1, :pswitch_data_1e

    .line 928
    :goto_e
    return v0

    .line 915
    :pswitch_f
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget v0, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->colorSectionColumns:I

    .line 916
    goto :goto_e

    .line 918
    :pswitch_14
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget v0, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->colorThemeSectionColumns:I

    .line 919
    goto :goto_e

    .line 925
    :pswitch_19
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    iget v0, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;->imageSectionColumns:I

    goto :goto_e

    .line 913
    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_f
        :pswitch_14
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_19
        :pswitch_19
    .end packed-switch
.end method

.method protected getNumOfItemsInSection(I)I
    .registers 5
    .param p1, "rawsection"    # I

    .prologue
    .line 616
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getLibrarySectionFromRawSectionNum(I)I

    move-result v1

    .line 617
    .local v1, "section":I
    const/4 v0, 0x0

    .line 618
    .local v0, "count":I
    packed-switch v1, :pswitch_data_58

    .line 647
    const/4 v0, 0x0

    .line 650
    :goto_9
    return v0

    .line 620
    :pswitch_a
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 621
    goto :goto_9

    .line 624
    :pswitch_15
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 625
    goto :goto_9

    .line 628
    :pswitch_20
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 629
    goto :goto_9

    .line 632
    :pswitch_2b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 633
    goto :goto_9

    .line 636
    :pswitch_36
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 637
    goto :goto_9

    .line 640
    :pswitch_41
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 641
    goto :goto_9

    .line 644
    :pswitch_4c
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 645
    goto :goto_9

    .line 618
    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_a
        :pswitch_15
        :pswitch_20
        :pswitch_2b
        :pswitch_36
        :pswitch_41
        :pswitch_4c
    .end packed-switch
.end method

.method protected getSectionCount()I
    .registers 4

    .prologue
    .line 576
    const/4 v0, 0x0

    .line 577
    .local v0, "sectionCount":I
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_21

    .line 578
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 579
    add-int/lit8 v0, v0, 0x1

    .line 581
    :cond_21
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_41

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_41

    .line 582
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 583
    add-int/lit8 v0, v0, 0x1

    .line 585
    :cond_41
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_61

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_61

    .line 586
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 587
    add-int/lit8 v0, v0, 0x1

    .line 589
    :cond_61
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_81

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_81

    .line 590
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 591
    add-int/lit8 v0, v0, 0x1

    .line 594
    :cond_81
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_a1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_a1

    .line 595
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 596
    add-int/lit8 v0, v0, 0x1

    .line 598
    :cond_a1
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_c1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_c1

    .line 599
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 600
    add-int/lit8 v0, v0, 0x1

    .line 602
    :cond_c1
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_e1

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_e1

    .line 603
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionNumToLibrarySection:Landroid/util/SparseArray;

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 604
    add-int/lit8 v0, v0, 0x1

    .line 606
    :cond_e1
    return v0
.end method

.method protected getSectionItemViewType(II)I
    .registers 5
    .param p1, "rawsection"    # I
    .param p2, "positionWithinSection"    # I

    .prologue
    .line 888
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getLibrarySectionFromRawSectionNum(I)I

    move-result v0

    .line 889
    .local v0, "section":I
    move v1, v0

    .line 890
    .local v1, "viewType":I
    return v1
.end method

.method protected getSectionViewType(I)I
    .registers 3
    .param p1, "sectionNum"    # I

    .prologue
    .line 895
    const/4 v0, 0x7

    return v0
.end method

.method public invalidateAdapter()V
    .registers 2

    .prologue
    .line 536
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->_sectionColumnCountDetails:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter$SectionColumnDetais;

    .line 537
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->rebuildLibraryItems()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)V

    .line 538
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->invalidateAdapter()V

    .line 539
    return-void
.end method

.method protected onBindViewHolderOfSection(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 11
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "rawsection"    # I

    .prologue
    .line 836
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getLibrarySectionFromRawSectionNum(I)I

    move-result v4

    .local v4, "section":I
    move-object v1, p1

    .line 837
    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;

    .line 839
    .local v1, "headerCellHolder":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;
    const/4 v0, 0x0

    .line 840
    .local v0, "count":I
    const/4 v2, 0x0

    .line 841
    .local v2, "headerResId":I
    const/4 v3, 0x0

    .line 842
    .local v3, "headerTitle":Ljava/lang/String;
    packed-switch v4, :pswitch_data_8c

    .line 877
    :goto_d
    if-eqz v2, :cond_2b

    .line 878
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->getHostActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 879
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 881
    :cond_2b
    if-eqz v3, :cond_30

    .line 882
    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/designlibrary/AdobeDesignLibraryItemsCellHolders$HeaderCellHolder;->setTitle(Ljava/lang/String;)V

    .line 884
    :cond_30
    return-void

    .line 844
    :pswitch_31
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 845
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_color:I

    .line 846
    goto :goto_d

    .line 849
    :pswitch_3e
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_colorThemeArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 850
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_colortheme:I

    .line 851
    goto :goto_d

    .line 854
    :pswitch_4b
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 855
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_brushes:I

    .line 856
    goto :goto_d

    .line 859
    :pswitch_58
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 860
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_graphics:I

    .line 861
    goto :goto_d

    .line 864
    :pswitch_65
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_textstyle:I

    .line 865
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 866
    goto :goto_d

    .line 869
    :pswitch_72
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_layoutstyle:I

    .line 870
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 871
    goto :goto_d

    .line 873
    :pswitch_7f
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_design_library_header_looks:I

    .line 874
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_d

    .line 842
    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_31
        :pswitch_3e
        :pswitch_4b
        :pswitch_58
        :pswitch_65
        :pswitch_72
        :pswitch_7f
    .end packed-switch
.end method

.method protected onBindViewHolderOfSectionItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;II)V
    .registers 13
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "rawsection"    # I
    .param p3, "positionWithinSection"    # I

    .prologue
    .line 786
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->getLibrarySectionFromRawSectionNum(I)I

    move-result v6

    .line 788
    .local v6, "section":I
    packed-switch v6, :pswitch_data_86

    .line 830
    :goto_7
    return-void

    .line 790
    :pswitch_8
    invoke-direct {p0, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindColorItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    goto :goto_7

    .line 794
    :pswitch_c
    invoke-direct {p0, p1, p3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindColorThemeItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    goto :goto_7

    .line 798
    :pswitch_10
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_brushArray:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;

    .line 799
    .local v0, "brushItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v7

    invoke-direct {p0, v6, p1, v7, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    goto :goto_7

    .line 803
    .end local v0    # "brushItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
    :pswitch_24
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_imageItemsArray:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$600(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;

    .line 805
    .local v3, "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getPrimaryComponentType()Ljava/lang/String;

    move-result-object v7

    const-string v8, "image/vnd.adobe.shape+svg"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 806
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v2

    .line 812
    .local v2, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :goto_40
    invoke-direct {p0, v6, p1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    goto :goto_7

    .line 809
    .end local v2    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_44
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->getImage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v2

    .restart local v2    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    goto :goto_40

    .line 816
    .end local v2    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v3    # "imageItem":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
    :pswitch_49
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_charStylesArray:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;

    .line 817
    .local v1, "characterStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v7

    invoke-direct {p0, v6, p1, v7, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    goto :goto_7

    .line 821
    .end local v1    # "characterStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
    :pswitch_5d
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_layoutStylesArray:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$800(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;

    .line 822
    .local v4, "layoutStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v7

    invoke-direct {p0, v6, p1, v7, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    goto :goto_7

    .line 826
    .end local v4    # "layoutStyle":Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemLayoutStyle;
    :pswitch_71
    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->_looksArray:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;->access$900(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;

    .line 827
    .local v5, "look":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v7

    invoke-direct {p0, v6, p1, v7, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$LibraryItemsSectionAdapter;->bindImageCollectionLibraryItem(ILandroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;)V

    goto :goto_7

    .line 788
    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_8
        :pswitch_c
        :pswitch_10
        :pswitch_24
        :pswitch_49
        :pswitch_5d
        :pswitch_71
    .end packed-switch
.end method
