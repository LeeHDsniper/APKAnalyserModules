.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;
.super Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
.source "PackDetailPreviews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private backgroundColor:I

.field private baseDir:Ljava/lang/String;

.field private columnIndexDisplayName:I

.field private columnIndexIdentifier:I

.field private dividerSize:I

.field private fileExt:Ljava/lang/String;

.field private inflater:Landroid/view/LayoutInflater;

.field private lastPosition:I

.field private packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field picasso:Lit/sephiroth/android/library/picasso/Picasso;

.field private previewHeight:I

.field private previewWidth:I

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/content/Context;Landroid/database/Cursor;Z)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "c"    # Landroid/database/Cursor;
    .param p4, "autoRequery"    # Z

    .prologue
    .line 485
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .line 486
    invoke-direct {p0, p2, p3, p4}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 487
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 488
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 489
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->lastPosition:I

    .line 490
    return-void
.end method

.method private animateView(Landroid/view/View;I)V
    .registers 7
    .param p1, "viewToAnimate"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 596
    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->lastPosition:I

    if-le p2, v1, :cond_21

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Z

    move-result v1

    if-nez v1, :cond_21

    .line 598
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_slide_in_bottom_preview_effects:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 599
    .local v0, "animation":Landroid/view/animation/Animation;
    mul-int/lit8 v1, p2, 0x32

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 600
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 601
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->lastPosition:I

    .line 603
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :cond_21
    return-void
.end method

.method private initCursor(Landroid/database/Cursor;)V
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 499
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->lastPosition:I

    .line 500
    if-eqz p1, :cond_15

    .line 501
    const-string v0, "item_displayName"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexDisplayName:I

    .line 502
    const-string v0, "item_identifier"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexIdentifier:I

    .line 504
    :cond_15
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 513
    invoke-super {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemViewTypeUnCached(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 508
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->getItemId(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_c

    const/4 v0, -0x1

    :goto_b
    return v0

    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v0

    goto :goto_b
.end method

.method public loadImage(Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V
    .registers 13
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 606
    new-instance v0, Ljava/io/File;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->baseDir:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->fileExt:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 608
    .local v2, "path":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 610
    .local v1, "imageTag":I
    invoke-virtual {p3}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 611
    .local v5, "tag":Ljava/lang/Integer;
    if-eqz v5, :cond_76

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_76

    const/4 v4, 0x1

    .line 613
    .local v4, "same":Z
    :goto_35
    if-nez v4, :cond_75

    .line 614
    invoke-virtual {p3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-eqz v6, :cond_41

    .line 615
    const/4 v6, 0x0

    invoke-virtual {p3, v6}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 618
    :cond_41
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v6, p3}, Lit/sephiroth/android/library/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V

    .line 619
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v6, v2}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v3

    .line 621
    .local v3, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/RequestCreator;->fit()Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v8

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .line 622
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Z

    move-result v6

    if-eqz v6, :cond_78

    const-wide/16 v6, 0xc8

    :goto_5a
    invoke-virtual {v8, v6, v7}, Lit/sephiroth/android/library/picasso/RequestCreator;->fade(J)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v6

    new-instance v7, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 623
    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v2, p2, v8}, Lcom/adobe/creativesdk/aviary/graphics/CdsPreviewTransformer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lit/sephiroth/android/library/picasso/RequestCreator;->transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v6

    new-instance v7, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;

    invoke-direct {v7, p0, p3, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;Landroid/widget/ImageView;I)V

    .line 624
    invoke-virtual {v6, p3, v7}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    .line 634
    .end local v3    # "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    :cond_75
    return-void

    .line 611
    .end local v4    # "same":Z
    :cond_76
    const/4 v4, 0x0

    goto :goto_35

    .line 622
    .restart local v3    # "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    .restart local v4    # "same":Z
    :cond_78
    const-wide/16 v6, 0x0

    goto :goto_5a
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 15
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v9, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 548
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v5

    .line 550
    .local v5, "type":I
    if-eq v5, v9, :cond_8d

    .line 551
    iget-object v8, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 552
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    .line 554
    .local v4, "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 556
    .local v0, "cursor":Landroid/database/Cursor;
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v8

    if-ne v5, v8, :cond_3e

    .line 557
    if-eqz p2, :cond_2b

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridColumns:I
    invoke-static {v8}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$600(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)I

    move-result v8

    rem-int v8, p2, v8

    if-nez v8, :cond_8e

    :cond_2b
    move v2, v7

    .line 559
    .local v2, "first":Z
    :goto_2c
    if-eqz v2, :cond_90

    .line 560
    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->dividerSize:I

    iput v8, v4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->leftMargin:I

    .line 564
    :goto_32
    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->dividerSize:I

    iput v8, v4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->rightMargin:I

    .line 565
    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->dividerSize:I

    iput v8, v4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->topMargin:I

    .line 566
    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->dividerSize:I

    iput v8, v4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->bottomMargin:I

    .line 569
    .end local v2    # "first":Z
    :cond_3e
    if-eqz v0, :cond_9b

    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v8

    if-nez v8, :cond_9b

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexDisplayName:I

    if-le v8, v9, :cond_9b

    iget v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexIdentifier:I

    if-le v8, v9, :cond_9b

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->baseDir:Ljava/lang/String;

    if-eqz v8, :cond_9b

    .line 572
    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexIdentifier:I

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 573
    .local v3, "identifier":Ljava/lang/String;
    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexDisplayName:I

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 575
    .local v1, "displayName":Ljava/lang/String;
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v6

    if-ne v5, v6, :cond_93

    move-object v6, p1

    .line 576
    check-cast v6, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_6e
    move-object v6, p1

    .line 581
    check-cast v6, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewViewHolder;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    invoke-virtual {p0, v3, v1, v6}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->loadImage(Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 583
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v6

    if-ne v5, v6, :cond_8d

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mRecyclerScrolled:Z
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$100(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Z

    move-result v6

    if-nez v6, :cond_8d

    .line 584
    iget-object v6, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-direct {p0, v6, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->animateView(Landroid/view/View;I)V

    .line 593
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "displayName":Ljava/lang/String;
    .end local v3    # "identifier":Ljava/lang/String;
    .end local v4    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_8d
    :goto_8d
    return-void

    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v4    # "params":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :cond_8e
    move v2, v6

    .line 557
    goto :goto_2c

    .line 562
    .restart local v2    # "first":Z
    :cond_90
    iput v6, v4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->leftMargin:I

    goto :goto_32

    .line 578
    .end local v2    # "first":Z
    .restart local v1    # "displayName":Ljava/lang/String;
    .restart local v3    # "identifier":Ljava/lang/String;
    :cond_93
    iget-object v6, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->backgroundColor:I

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_6e

    .line 587
    .end local v1    # "displayName":Ljava/lang/String;
    .end local v3    # "identifier":Ljava/lang/String;
    :cond_9b
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v8

    const-string v9, "cursor: %s"

    new-array v10, v7, [Ljava/lang/Object;

    aput-object v0, v10, v6

    invoke-interface {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 588
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v8

    const-string v9, "columnIndexDisplayName: %d"

    new-array v10, v7, [Ljava/lang/Object;

    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexDisplayName:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v6

    invoke-interface {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 589
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v8

    const-string v9, "columnIndexIdentifier: %d"

    new-array v10, v7, [Ljava/lang/Object;

    iget v11, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->columnIndexIdentifier:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v6

    invoke-interface {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 590
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v8

    const-string v9, "baseDir: %s"

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->baseDir:Ljava/lang/String;

    aput-object v10, v7, v6

    invoke-interface {v8, v9, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_8d
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 11
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v7, 0x0

    const/4 v6, -0x1

    .line 522
    if-ne p2, v6, :cond_27

    .line 523
    new-instance v3, Landroid/view/View;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 524
    .local v3, "view":Landroid/view/View;
    new-instance v2, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->previewWidth:I

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mGridHiddenHeight:I
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$500(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)I

    move-result v5

    invoke-direct {v2, v4, v5}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    .line 525
    .local v2, "params1":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 526
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 527
    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;

    invoke-direct {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;-><init>(Landroid/view/View;)V

    .line 542
    .end local v2    # "params1":Landroid/support/v7/widget/GridLayoutManager$LayoutParams;
    :goto_26
    return-object v4

    .line 529
    .end local v3    # "view":Landroid/view/View;
    :cond_27
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v4

    if-ne p2, v4, :cond_4f

    .line 530
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->inflater:Landroid/view/LayoutInflater;

    sget v5, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_store_detail_preview_effect:I

    invoke-virtual {v4, v5, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 531
    .restart local v3    # "view":Landroid/view/View;
    sget v4, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 533
    .local v1, "imageView":Landroid/widget/ImageView;
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 534
    .local v0, "imageParams":Landroid/view/ViewGroup$LayoutParams;
    iput v6, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 535
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->previewHeight:I

    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 536
    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;

    invoke-direct {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewEffectViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_26

    .line 538
    .end local v0    # "imageParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v1    # "imageView":Landroid/widget/ImageView;
    .end local v3    # "view":Landroid/view/View;
    :cond_4f
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->inflater:Landroid/view/LayoutInflater;

    sget v5, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_store_detail_preview_sticker:I

    invoke-virtual {v4, v5, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 539
    .restart local v3    # "view":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 540
    .local v2, "params1":Landroid/view/ViewGroup$LayoutParams;
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->previewWidth:I

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 541
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->previewHeight:I

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 542
    new-instance v4, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewStickerViewHolder;

    invoke-direct {v4, v3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewStickerViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_26
.end method

.method public setBackgroundColor(I)V
    .registers 2
    .param p1, "backgroundColor"    # I

    .prologue
    .line 667
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->backgroundColor:I

    .line 668
    return-void
.end method

.method public setDividerSize(I)V
    .registers 2
    .param p1, "dividerSize"    # I

    .prologue
    .line 637
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->dividerSize:I

    .line 638
    return-void
.end method

.method public setFileExt(Ljava/lang/String;)V
    .registers 2
    .param p1, "fileExt"    # Ljava/lang/String;

    .prologue
    .line 650
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->fileExt:Ljava/lang/String;

    .line 651
    return-void
.end method

.method public setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 2
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 659
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 660
    return-void
.end method

.method public setPreviewPath(Ljava/lang/String;)V
    .registers 2
    .param p1, "previewPath"    # Ljava/lang/String;

    .prologue
    .line 646
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->baseDir:Ljava/lang/String;

    .line 647
    return-void
.end method

.method public setPreviewSize(II)V
    .registers 3
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    .line 641
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->previewWidth:I

    .line 642
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->previewHeight:I

    .line 643
    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 3
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .line 494
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->initCursor(Landroid/database/Cursor;)V

    .line 495
    invoke-super {p0, p1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
