.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;
.super Landroid/support/v4/widget/CursorAdapter;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyCursorAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field displayNameColumnIndex:I

.field iconPackColumnIndex:I

.field idColumnIndex:I

.field identifierColumnIndex:I

.field isFreeWithLoginIndex:I

.field itemsCountColumnIndex:I

.field mMaxImageSize:I

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Landroid/content/Context;Landroid/database/Cursor;)V
    .registers 6
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;

    .prologue
    .line 606
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .line 607
    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v4/widget/CursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 608
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_store_list_icon_size:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->mMaxImageSize:I

    .line 609
    invoke-virtual {p0, p3}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->initCursor(Landroid/database/Cursor;)V

    .line 610
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .registers 30
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 648
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->getItemViewType(I)I

    move-result v18

    .line 649
    .local v18, "type":I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    .line 651
    .local v8, "holder":Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;
    if-nez v8, :cond_15

    .line 727
    :cond_14
    :goto_14
    return-void

    .line 655
    :cond_15
    if-nez v18, :cond_19e

    .line 656
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->idColumnIndex:I

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 657
    .local v12, "packid":J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->displayNameColumnIndex:I

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 658
    .local v17, "title":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->iconPackColumnIndex:I

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 659
    .local v9, "iconPath":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->identifierColumnIndex:I

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 660
    .local v10, "identifier":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->itemsCountColumnIndex:I

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 661
    .local v11, "itemsCount":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->isFreeWithLoginIndex:I

    move/from16 v19, v0

    move-object/from16 v0, p3

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 663
    .local v6, "freeWithLogin":I
    const/4 v14, 0x1

    .line 665
    .local v14, "process":Z
    if-eqz v9, :cond_18a

    .line 667
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v16

    .line 668
    .local v16, "tag":Ljava/lang/Object;
    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v7

    .line 669
    .local v7, "hashCode":I
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/lang/Integer;

    move/from16 v19, v0

    if-eqz v19, :cond_8d

    .line 670
    check-cast v16, Ljava/lang/Integer;

    .end local v16    # "tag":Ljava/lang/Object;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    if-ne v0, v7, :cond_8d

    .line 671
    const/4 v14, 0x0

    .line 675
    :cond_8d
    if-eqz v14, :cond_119

    .line 676
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v19, v0

    .line 677
    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v19

    const-wide/16 v20, 0xc8

    invoke-virtual/range {v19 .. v21}, Lit/sephiroth/android/library/picasso/RequestCreator;->fade(J)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->mMaxImageSize:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->mMaxImageSize:I

    move/from16 v21, v0

    invoke-virtual/range {v19 .. v21}, Lit/sephiroth/android/library/picasso/RequestCreator;->resize(II)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lit/sephiroth/android/library/picasso/RequestCreator;->onlyScaleDown()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v15

    .line 679
    .local v15, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v6, v0, :cond_105

    .line 680
    new-instance v19, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    invoke-direct/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;-><init>()V

    sget v20, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_pack_icon_badge:I

    const/16 v21, 0x35

    const/16 v22, 0x0

    .line 681
    invoke-virtual/range {v19 .. v22}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withOverlay(III)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v19

    .line 682
    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withPath(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-object/from16 v20, v0

    .line 683
    invoke-virtual/range {v20 .. v20}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withPackType(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v19

    const/16 v20, 0x0

    .line 684
    invoke-virtual/range {v19 .. v20}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withPalette(Z)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-object/from16 v20, v0

    .line 685
    invoke-virtual/range {v20 .. v20}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withResources(Landroid/content/res/Resources;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->build()Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;

    move-result-object v4

    .line 686
    .local v4, "callable":Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    invoke-virtual {v15, v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 689
    .end local v4    # "callable":Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    :cond_105
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    new-instance v20, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v8, v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    .line 706
    .end local v7    # "hashCode":I
    .end local v15    # "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    :cond_119
    :goto_119
    iput-wide v12, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    .line 707
    iput-object v10, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->identifier:Ljava/lang/String;

    .line 708
    iput v6, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->isFreeWithLogin:I

    .line 710
    if-eqz v14, :cond_13b

    .line 711
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->title:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 712
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v8, v11, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->setItemCount(ILcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 715
    :cond_13b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-object/from16 v19, v0

    # getter for: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->packOptionMap:Ljava/util/HashMap;
    invoke-static/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->access$100(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)Ljava/util/HashMap;

    move-result-object v19

    iget-wide v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 718
    .local v5, "finalOption":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    if-nez v5, :cond_179

    .line 719
    sget-object v19, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v20, "%d, option is null"

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    iget-wide v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-interface/range {v19 .. v21}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 720
    new-instance v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .end local v5    # "finalOption":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    sget-object v19, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->ERROR:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    move-object/from16 v0, v19

    invoke-direct {v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)V

    .line 722
    .restart local v5    # "finalOption":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :cond_179
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    move-object/from16 v19, v0

    iget-wide v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->packid:J

    move-wide/from16 v20, v0

    move-object/from16 v0, v19

    move-wide/from16 v1, v20

    invoke-virtual {v0, v5, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setPackOption(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;J)V

    goto/16 :goto_14

    .line 702
    .end local v5    # "finalOption":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :cond_18a
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 703
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_119

    .line 723
    .end local v6    # "freeWithLogin":I
    .end local v9    # "iconPath":Ljava/lang/String;
    .end local v10    # "identifier":Ljava/lang/String;
    .end local v11    # "itemsCount":I
    .end local v12    # "packid":J
    .end local v14    # "process":Z
    .end local v17    # "title":Ljava/lang/String;
    :cond_19e
    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_14

    .line 725
    iget-object v0, v8, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->title:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    move-object/from16 v20, v0

    sget v21, Lcom/aviary/android/feather/sdk/R$string;->feather_store_checking_additional_packs:I

    invoke-virtual/range {v20 .. v21}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_14
.end method

.method public getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 614
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->getItemId(I)J

    move-result-wide v0

    .line 615
    .local v0, "id":J
    const-wide/16 v2, -0x2

    cmp-long v2, v0, v2

    if-nez v2, :cond_c

    .line 616
    const/4 v2, 0x2

    .line 620
    :goto_b
    return v2

    .line 617
    :cond_c
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_14

    .line 618
    const/4 v2, 0x1

    goto :goto_b

    .line 620
    :cond_14
    const/4 v2, 0x0

    goto :goto_b
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 625
    const/4 v0, 0x3

    return v0
.end method

.method protected initCursor(Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 635
    if-eqz p1, :cond_32

    .line 636
    const-string v0, "pack_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->idColumnIndex:I

    .line 637
    const-string v0, "content_displayName"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->displayNameColumnIndex:I

    .line 638
    const-string v0, "content_iconPath"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->iconPackColumnIndex:I

    .line 639
    const-string v0, "pack_identifier"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->identifierColumnIndex:I

    .line 640
    const-string v0, "content_numItems"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->itemsCountColumnIndex:I

    .line 641
    const-string v0, "content_isFreeWithLogin"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->isFreeWithLoginIndex:I

    .line 643
    :cond_32
    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v8, 0x0

    .line 732
    invoke-interface {p2}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->getItemViewType(I)I

    move-result v4

    .line 734
    .local v4, "type":I
    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;)V

    .line 736
    .local v1, "holder":Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;
    if-nez v4, :cond_43

    .line 737
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    sget v7, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_store_list_item:I

    invoke-virtual {v6, v7, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 738
    .local v5, "view":Landroid/view/View;
    sget v6, Lcom/aviary/android/feather/sdk/R$id;->com_adobe_image_buy_button:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .line 739
    .local v0, "buttonContainer":Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
    sget v6, Lcom/aviary/android/feather/sdk/R$id;->title:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 740
    .local v3, "textView1":Landroid/widget/TextView;
    sget v6, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 742
    .local v2, "imageView":Landroid/widget/ImageView;
    iput-object v3, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->title:Landroid/widget/TextView;

    .line 743
    iput-object v2, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 744
    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    .line 745
    iget-object v6, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->buttonContainer:Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 754
    .end local v0    # "buttonContainer":Lcom/adobe/creativesdk/aviary/widget/IAPBuyButton;
    .end local v2    # "imageView":Landroid/widget/ImageView;
    .end local v3    # "textView1":Landroid/widget/TextView;
    :goto_3f
    invoke-virtual {v5, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 755
    return-object v5

    .line 747
    .end local v5    # "view":Landroid/view/View;
    :cond_43
    const/4 v6, 0x1

    if-ne v4, v6, :cond_5d

    .line 748
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    const v7, 0x1090003

    invoke-virtual {v6, v7, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 749
    .restart local v5    # "view":Landroid/view/View;
    const v6, 0x1020014

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter$ViewHolder;->title:Landroid/widget/TextView;

    goto :goto_3f

    .line 751
    .end local v5    # "view":Landroid/view/View;
    :cond_5d
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "invalid type"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 3
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .line 630
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$MyCursorAdapter;->initCursor(Landroid/database/Cursor;)V

    .line 631
    invoke-super {p0, p1}, Landroid/support/v4/widget/CursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
