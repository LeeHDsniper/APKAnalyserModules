.class public Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
.super Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;
.source "PacksListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ContentPackViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$RightGetMoreViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$LeftGetMoreViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;,
        Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/android/ui/widget/RecyclerCursorAdapter",
        "<",
        "Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter",
        "<",
        "Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private accentColor:I

.field private cache:Lit/sephiroth/android/library/picasso/Cache;

.field private caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

.field private cellWidth:I

.field private defaultPackTextBackgroundColor:I

.field mCheckedItemPosition:I

.field mDefaultResId:I

.field mDividerResId:I

.field mExternalResId:I

.field mInflater:Landroid/view/LayoutInflater;

.field mInternalResId:I

.field mMoreResId:I

.field final mPackIdCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final mPacksColorCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field private picasso:Lit/sephiroth/android/library/picasso/Picasso;


# direct methods
.method public constructor <init>(Landroid/content/Context;IIIIILandroid/database/Cursor;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defaultResId"    # I
    .param p3, "moreResId"    # I
    .param p4, "externalResId"    # I
    .param p5, "dividerResId"    # I
    .param p6, "internalResId"    # I
    .param p7, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 175
    const/4 v0, 0x0

    invoke-direct {p0, p1, p7, v0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I)V

    .line 155
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPackIdCache:Ljava/util/HashMap;

    .line 177
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 178
    iput p2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mDefaultResId:I

    .line 179
    iput p3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mMoreResId:I

    .line 180
    iput p4, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mExternalResId:I

    .line 181
    iput p5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mDividerResId:I

    .line 182
    iput p6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInternalResId:I

    .line 183
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPacksColorCache:Ljava/util/HashMap;

    .line 184
    return-void
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cellWidth:I

    return p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    return-object p1
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lit/sephiroth/android/library/picasso/Picasso;)Lit/sephiroth/android/library/picasso/Picasso;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # Lit/sephiroth/android/library/picasso/Picasso;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    return-object p1
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/Cache;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # Lit/sephiroth/android/library/picasso/Cache;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    return-object p1
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .prologue
    .line 48
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->defaultPackTextBackgroundColor:I

    return v0
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->defaultPackTextBackgroundColor:I

    return p1
.end method

.method static synthetic access$502(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    return-object p1
.end method

.method static synthetic access$602(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->accentColor:I

    return p1
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V
    .registers 5
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;
    .param p2, "x2"    # J
    .param p4, "x3"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBitmapLoaded(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPacksColorCache:Ljava/util/HashMap;

    return-object v0
.end method

.method private onBitmapLoaded(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V
    .registers 15
    .param p1, "holder"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;
    .param p2, "id"    # J
    .param p4, "identifier"    # Ljava/lang/String;

    .prologue
    .line 405
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->getItemId()J

    move-result-wide v2

    cmp-long v1, v2, p2

    if-nez v1, :cond_6c

    .line 407
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPacksColorCache:Ljava/util/HashMap;

    invoke-virtual {v1, p4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 408
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPacksColorCache:Ljava/util/HashMap;

    invoke-virtual {v1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 409
    .local v7, "color":I
    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 410
    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v7}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->animateBackgroundColor(Landroid/view/View;I)V

    .line 444
    .end local v7    # "color":I
    :goto_26
    return-void

    .line 412
    :cond_27
    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 413
    .local v8, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v1, v8, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_53

    .line 414
    check-cast v8, Landroid/graphics/drawable/BitmapDrawable;

    .end local v8    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v8}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 415
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_4b

    .line 416
    new-instance v9, Landroid/support/v7/graphics/Palette$Builder;

    invoke-direct {v9, v0}, Landroid/support/v7/graphics/Palette$Builder;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$3;-><init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;JLjava/lang/String;)V

    invoke-virtual {v9, v1}, Landroid/support/v7/graphics/Palette$Builder;->generate(Landroid/support/v7/graphics/Palette$PaletteAsyncListener;)Landroid/os/AsyncTask;

    goto :goto_26

    .line 434
    :cond_4b
    const-string v1, "PacksListAdapter"

    const-string v2, "null bitmap"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26

    .line 437
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v8    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_53
    const-string v1, "PacksListAdapter"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a BitmapDrawable"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26

    .line 442
    .end local v8    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_6c
    const-string v1, "PacksListAdapter"

    const-string v2, "invalid item id"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_26
.end method


# virtual methods
.method protected animateBackgroundColor(Landroid/view/View;I)V
    .registers 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "color"    # I

    .prologue
    .line 474
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    .line 475
    .local v1, "drawable":Landroid/graphics/drawable/ColorDrawable;
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v3

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 477
    .local v2, "newDrawable":Landroid/graphics/drawable/ColorDrawable;
    sget-boolean v3, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v3, :cond_45

    .line 478
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 483
    :goto_16
    new-instance v3, Lcom/nineoldandroids/animation/ArgbEvaluator;

    invoke-direct {v3}, Lcom/nineoldandroids/animation/ArgbEvaluator;-><init>()V

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Lcom/nineoldandroids/animation/ValueAnimator;->ofObject(Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    .line 484
    .local v0, "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    const-wide/16 v4, 0xc8

    invoke-virtual {v0, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 485
    new-instance v3, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;

    invoke-direct {v3, p0, v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$4;-><init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Landroid/graphics/drawable/ColorDrawable;)V

    invoke-virtual {v0, v3}, Lcom/nineoldandroids/animation/ValueAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 497
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 498
    return-void

    .line 480
    .end local v0    # "animator":Lcom/nineoldandroids/animation/ValueAnimator;
    :cond_45
    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_16
.end method

.method protected clearCaches()V
    .registers 2

    .prologue
    .line 201
    invoke-super {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->clearCaches()V

    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPackIdCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 203
    return-void
.end method

.method public getHeaderId(I)J
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 502
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItemViewType(I)I

    move-result v2

    .line 504
    .local v2, "type":I
    if-nez v2, :cond_3d

    .line 505
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPackIdCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 506
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPackIdCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 514
    :goto_22
    return-wide v0

    .line 508
    :cond_23
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/database/Cursor;

    const/16 v4, 0x9

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 509
    .local v0, "packId":J
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mPackIdCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22

    .line 514
    .end local v0    # "packId":J
    :cond_3d
    const-wide/16 v0, -0x1

    goto :goto_22
.end method

.method public getItemCheckedPosition()I
    .registers 2

    .prologue
    .line 196
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mCheckedItemPosition:I

    return v0
.end method

.method public getItemViewTypeUnCached(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 218
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_1a

    invoke-interface {v0}, Landroid/database/Cursor;->isBeforeFirst()Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 219
    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 221
    :goto_19
    return v1

    :cond_1a
    const/4 v1, -0x1

    goto :goto_19
.end method

.method protected onBindContentViewHolder(ILcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V
    .registers 11
    .param p1, "position"    # I
    .param p2, "holder"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 312
    const/4 v5, 0x5

    invoke-interface {p3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 313
    .local v0, "displayName":Ljava/lang/String;
    const/4 v5, 0x3

    invoke-interface {p3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 314
    .local v2, "identifier":Ljava/lang/String;
    const/4 v5, 0x6

    invoke-interface {p3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 316
    .local v3, "path":Ljava/lang/String;
    iget-object v5, p2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v5, p2

    .line 317
    check-cast v5, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ContentPackViewHolder;

    iput-object v2, v5, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ContentPackViewHolder;->identifier:Ljava/lang/String;

    .line 318
    iget-object v5, p2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->itemView:Landroid/view/View;

    check-cast v5, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mCheckedItemPosition:I

    if-ne v6, p1, :cond_62

    const/4 v6, 0x1

    :goto_22
    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->setChecked(Z)V

    .line 323
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-ne v5, v6, :cond_64

    .line 324
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "aviary_effect://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".json"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 332
    .local v1, "file":Ljava/lang/String;
    :goto_4e
    iget-object v5, p2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v5}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9d

    .line 333
    const-string v5, "PacksListAdapter"

    const-string v6, "skip effect, already rendered"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    :goto_61
    return-void

    .line 318
    .end local v1    # "file":Ljava/lang/String;
    :cond_62
    const/4 v6, 0x0

    goto :goto_22

    .line 326
    :cond_64
    const-string v5, "file://"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7f

    .line 327
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 329
    :cond_7f
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-small.png"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "file":Ljava/lang/String;
    goto :goto_4e

    .line 337
    :cond_9d
    iget-object v5, p2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 339
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Lit/sephiroth/android/library/picasso/Picasso;->load(Landroid/net/Uri;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    .line 340
    .local v4, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    if-eqz v5, :cond_b6

    .line 341
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {v4, v5}, Lit/sephiroth/android/library/picasso/RequestCreator;->withCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 343
    :cond_b6
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->EFFECT:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-ne v5, v6, :cond_c6

    .line 344
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cellWidth:I

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cellWidth:I

    invoke-virtual {v4, v5, v6}, Lit/sephiroth/android/library/picasso/RequestCreator;->resize(II)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 345
    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/RequestCreator;->centerCrop()Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 348
    :cond_c6
    iget-object v5, p2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    new-instance v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;

    invoke-direct {v6, p0, p2, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Ljava/lang/String;)V

    invoke-virtual {v4, v5, v6}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    goto :goto_61
.end method

.method protected onBindExternalViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V
    .registers 15
    .param p1, "holder"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 363
    const/4 v1, 0x3

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 364
    .local v6, "identifier":Ljava/lang/String;
    const/4 v1, 0x5

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 365
    .local v0, "displayName":Ljava/lang/String;
    const/4 v1, 0x6

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 366
    .local v8, "icon":Ljava/lang/String;
    const/16 v1, 0x8

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 367
    .local v7, "free":I
    const/4 v1, 0x0

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .local v4, "id":J
    move-object v1, p1

    .line 369
    check-cast v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v1, p1

    .line 370
    check-cast v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iput-object v6, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->identifier:Ljava/lang/String;

    move-object v1, p1

    .line 371
    check-cast v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iput v7, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->free:I

    .line 373
    new-instance v10, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;

    invoke-direct {v10}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;-><init>()V

    .line 374
    .local v10, "transformation":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$PaletteTransformation;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v1, v8}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v9

    .line 375
    .local v9, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    invoke-virtual {v9, v10}, Lit/sephiroth/android/library/picasso/RequestCreator;->transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 377
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    if-eqz v1, :cond_43

    .line 378
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {v9, v1}, Lit/sephiroth/android/library/picasso/RequestCreator;->withCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 381
    :cond_43
    iget-object v11, p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;JLjava/lang/String;)V

    invoke-virtual {v9, v11, v1}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Callback;)V

    .line 402
    return-void
.end method

.method public bridge synthetic onBindHeaderViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3

    .prologue
    .line 48
    check-cast p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBindHeaderViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;I)V

    return-void
.end method

.method public onBindHeaderViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;I)V
    .registers 8
    .param p1, "holder"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 525
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 526
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_1e

    .line 527
    const/16 v3, 0xa

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 529
    .local v2, "packDisplayName":Ljava/lang/String;
    new-instance v1, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;

    .line 530
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_ContentSectionHeaderText:I

    invoke-direct {v1, v3, v4, v2}, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;-><init>(Landroid/content/Context;ILjava/lang/String;)V

    .line 534
    .local v1, "d":Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;
    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 536
    .end local v1    # "d":Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;
    .end local v2    # "packDisplayName":Ljava/lang/String;
    :cond_1e
    return-void
.end method

.method protected onBindInternalViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V
    .registers 11
    .param p1, "holder"    # Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .param p2, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 447
    const/4 v6, 0x3

    invoke-interface {p2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 448
    .local v3, "identifier":Ljava/lang/String;
    const/4 v6, 0x5

    invoke-interface {p2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 449
    .local v0, "displayName":Ljava/lang/String;
    const/4 v6, 0x6

    invoke-interface {p2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 450
    .local v2, "icon":Ljava/lang/String;
    const/16 v6, 0x8

    invoke-interface {p2, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .local v1, "free":I
    move-object v6, p1

    .line 452
    check-cast v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v6, p1

    .line 453
    check-cast v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;

    iput-object v3, v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;->identifier:Ljava/lang/String;

    move-object v6, p1

    .line 454
    check-cast v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;

    iput v1, v6, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;->free:I

    .line 456
    new-instance v6, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    invoke-direct {v6}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;-><init>()V

    .line 458
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withResources(Landroid/content/res/Resources;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 459
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withPackType(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v6

    .line 460
    invoke-virtual {v6, v2}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->withPath(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;

    move-result-object v6

    .line 461
    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;->build()Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;

    move-result-object v5

    .line 463
    .local v5, "transformer":Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v6, v2}, Lit/sephiroth/android/library/picasso/Picasso;->load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v4

    .line 464
    .local v4, "request":Lit/sephiroth/android/library/picasso/RequestCreator;
    invoke-virtual {v4, v5}, Lit/sephiroth/android/library/picasso/RequestCreator;->transform(Lit/sephiroth/android/library/picasso/Transformation;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 466
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    if-eqz v6, :cond_5c

    .line 467
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {v4, v6}, Lit/sephiroth/android/library/picasso/RequestCreator;->withCache(Lit/sephiroth/android/library/picasso/Cache;)Lit/sephiroth/android/library/picasso/RequestCreator;

    .line 470
    :cond_5c
    iget-object v6, p1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v6}, Lit/sephiroth/android/library/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V

    .line 471
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 11
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v7, 0x0

    .line 290
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    .local v3, "type":I
    move-object v1, p1

    .line 291
    check-cast v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    .line 292
    .local v1, "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 294
    .local v0, "cursor":Landroid/database/Cursor;
    const-string v4, "PacksListAdapter"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onBindViewHolder: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    const/4 v4, 0x1

    if-ne v3, v4, :cond_2d

    .line 297
    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBindExternalViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V

    .line 309
    :cond_2c
    :goto_2c
    return-void

    .line 298
    :cond_2d
    const/4 v4, 0x2

    if-ne v3, v4, :cond_34

    .line 299
    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBindInternalViewHolder(Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V

    goto :goto_2c

    .line 300
    :cond_34
    if-nez v3, :cond_3a

    .line 301
    invoke-virtual {p0, p2, v1, v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onBindContentViewHolder(ILcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;Landroid/database/Cursor;)V

    goto :goto_2c

    .line 302
    :cond_3a
    const/4 v4, 0x5

    if-ne v3, v4, :cond_48

    .line 303
    iget-object v4, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 304
    .local v2, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iput v7, v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;->leftMargin:I

    goto :goto_2c

    .line 305
    .end local v2    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_48
    const/4 v4, 0x6

    if-ne v3, v4, :cond_2c

    .line 306
    iget-object v4, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 307
    .restart local v2    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iput v7, v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;->rightMargin:I

    goto :goto_2c
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    invoke-interface {v0, p0, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;->onItemClick(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/view/View;)V

    .line 59
    return-void
.end method

.method protected onContentChanged()V
    .registers 1

    .prologue
    .line 212
    invoke-super {p0}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->onContentChanged()V

    .line 213
    return-void
.end method

.method public bridge synthetic onCreateHeaderViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onCreateHeaderViewHolder(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateHeaderViewHolder(Landroid/view/ViewGroup;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 519
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mDividerResId:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 520
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;

    invoke-direct {v1, v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;-><init>(Landroid/view/View;)V

    return-object v1
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4

    .prologue
    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .registers 11
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v7, 0x0

    .line 229
    packed-switch p2, :pswitch_data_a6

    .line 274
    :pswitch_4
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mDefaultResId:I

    invoke-virtual {v5, v6, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 275
    .local v4, "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ContentPackViewHolder;

    invoke-direct {v1, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ContentPackViewHolder;-><init>(Landroid/view/View;)V

    .line 277
    .local v1, "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->accentColor:I

    if-eqz v5, :cond_20

    .line 278
    sget v5, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->accentColor:I

    invoke-static {v5, v6}, Lcom/adobe/android/ui/utils/UIUtils;->setViewBackgroundTint(Landroid/view/View;I)Z

    .line 284
    :cond_20
    :goto_20
    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 285
    return-object v1

    .line 231
    .end local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v4    # "view":Landroid/view/View;
    :pswitch_24
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mMoreResId:I

    invoke-virtual {v5, v6, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 232
    .restart local v4    # "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$LeftGetMoreViewHolder;

    invoke-direct {v1, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$LeftGetMoreViewHolder;-><init>(Landroid/view/View;)V

    .line 233
    .restart local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    goto :goto_20

    .line 236
    .end local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v4    # "view":Landroid/view/View;
    :pswitch_32
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mMoreResId:I

    invoke-virtual {v5, v6, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 237
    .restart local v4    # "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$RightGetMoreViewHolder;

    invoke-direct {v1, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$RightGetMoreViewHolder;-><init>(Landroid/view/View;)V

    .line 239
    .restart local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cellWidth:I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItemCount()I

    move-result v6

    mul-int v3, v5, v6

    .line 241
    .local v3, "totalSize":I
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->caller:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;

    invoke-interface {v5}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getWidth()I

    move-result v5

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->cellWidth:I

    mul-int/lit8 v6, v6, 0x3

    add-int/2addr v5, v6

    if-ge v3, v5, :cond_20

    .line 242
    new-instance v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-direct {v2, v7, v7}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    .line 243
    .local v2, "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iget-object v5, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v5, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    iget-object v5, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->itemView:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_20

    .line 250
    .end local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v2    # "params":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .end local v3    # "totalSize":I
    .end local v4    # "view":Landroid/view/View;
    :pswitch_69
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInternalResId:I

    invoke-virtual {v5, v6, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 251
    .restart local v4    # "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;

    invoke-direct {v1, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$InternalPackViewHolder;-><init>(Landroid/view/View;)V

    .line 252
    .restart local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    goto :goto_20

    .line 255
    .end local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v4    # "view":Landroid/view/View;
    :pswitch_77
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mExternalResId:I

    invoke-virtual {v5, v6, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 256
    .restart local v4    # "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    invoke-direct {v1, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;-><init>(Landroid/view/View;)V

    .line 257
    .restart local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    goto :goto_20

    .line 260
    .end local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v4    # "view":Landroid/view/View;
    :pswitch_85
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mDividerResId:I

    invoke-virtual {v5, v6, p1, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 261
    .restart local v4    # "view":Landroid/view/View;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;

    invoke-direct {v1, v4}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$SectionHeaderViewHolder;-><init>(Landroid/view/View;)V

    .line 263
    .restart local v1    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    new-instance v0, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;

    .line 264
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_ContentSectionHeaderText:I

    sget v7, Lcom/aviary/android/feather/sdk/R$string;->feather_owned:I

    invoke-direct {v0, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;-><init>(Landroid/content/Context;II)V

    .line 268
    .local v0, "d":Lcom/adobe/creativesdk/aviary/graphics/PluginDividerDrawable;
    iget-object v5, v1, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_20

    .line 229
    :pswitch_data_a6
    .packed-switch 0x1
        :pswitch_77
        :pswitch_69
        :pswitch_4
        :pswitch_4
        :pswitch_24
        :pswitch_32
        :pswitch_85
    .end packed-switch
.end method

.method public setItemCheckedPosition(IZ)V
    .registers 8
    .param p1, "position"    # I
    .param p2, "checked"    # Z

    .prologue
    .line 187
    const-string v2, "PacksListAdapter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setItemCheckedPosition: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", checked: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    move v0, p1

    .line 190
    .local v0, "newPosition":I
    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mCheckedItemPosition:I

    .line 191
    .local v1, "oldPosition":I
    if-eqz p2, :cond_2d

    .end local v0    # "newPosition":I
    :goto_27
    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->mCheckedItemPosition:I

    .line 192
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->notifyDataSetChanged()V

    .line 193
    return-void

    .line 191
    .restart local v0    # "newPosition":I
    :cond_2d
    const/4 v0, -0x1

    goto :goto_27
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 3
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .line 207
    invoke-super {p0, p1}, Lcom/adobe/android/ui/widget/RecyclerCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
