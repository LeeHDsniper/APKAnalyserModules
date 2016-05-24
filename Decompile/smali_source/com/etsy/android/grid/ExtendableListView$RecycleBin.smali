.class Lcom/etsy/android/grid/ExtendableListView$RecycleBin;
.super Ljava/lang/Object;
.source "ExtendableListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etsy/android/grid/ExtendableListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RecycleBin"
.end annotation


# instance fields
.field private mActiveViews:[Landroid/view/View;

.field private mCurrentScrap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mFirstActivePosition:I

.field private mScrapViews:[Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mSkippedScrap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SparseArrayCompat",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mViewTypeCount:I

.field final synthetic this$0:Lcom/etsy/android/grid/ExtendableListView;


# direct methods
.method constructor <init>(Lcom/etsy/android/grid/ExtendableListView;)V
    .registers 3

    .prologue
    .line 2159
    iput-object p1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2172
    const/4 v0, 0x0

    new-array v0, v0, [Landroid/view/View;

    iput-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    return-void
.end method

.method private pruneScrapViews()V
    .registers 14

    .prologue
    .line 2444
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    array-length v3, v10

    .line 2445
    .local v3, "maxViews":I
    iget v9, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    .line 2446
    .local v9, "viewTypeCount":I
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    .line 2447
    .local v5, "scrapViews":[Ljava/util/ArrayList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-lt v1, v9, :cond_18

    .line 2457
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    if-eqz v10, :cond_17

    .line 2458
    const/4 v1, 0x0

    :goto_f
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v10}, Landroid/support/v4/util/SparseArrayCompat;->size()I

    move-result v10

    if-lt v1, v10, :cond_3b

    .line 2466
    :cond_17
    return-void

    .line 2448
    :cond_18
    aget-object v4, v5, v1

    .line 2449
    .local v4, "scrapPile":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 2450
    .local v6, "size":I
    sub-int v0, v6, v3

    .line 2451
    .local v0, "extras":I
    add-int/lit8 v6, v6, -0x1

    .line 2452
    const/4 v2, 0x0

    .local v2, "j":I
    move v7, v6

    .end local v6    # "size":I
    .local v7, "size":I
    :goto_24
    if-lt v2, v0, :cond_29

    .line 2447
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 2453
    :cond_29
    iget-object v11, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    add-int/lit8 v6, v7, -0x1

    .end local v7    # "size":I
    .restart local v6    # "size":I
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    const/4 v12, 0x0

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->removeDetachedView(Landroid/view/View;Z)V
    invoke-static {v11, v10, v12}, Lcom/etsy/android/grid/ExtendableListView;->access$14(Lcom/etsy/android/grid/ExtendableListView;Landroid/view/View;Z)V

    .line 2452
    add-int/lit8 v2, v2, 0x1

    move v7, v6

    .end local v6    # "size":I
    .restart local v7    # "size":I
    goto :goto_24

    .line 2459
    .end local v0    # "extras":I
    .end local v2    # "j":I
    .end local v4    # "scrapPile":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v7    # "size":I
    :cond_3b
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v10, v1}, Landroid/support/v4/util/SparseArrayCompat;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    .line 2460
    .local v8, "v":Landroid/view/View;
    invoke-static {v8}, Landroid/support/v4/view/ViewCompat;->hasTransientState(Landroid/view/View;)Z

    move-result v10

    if-nez v10, :cond_50

    .line 2461
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v10, v1}, Landroid/support/v4/util/SparseArrayCompat;->removeAt(I)V

    .line 2462
    add-int/lit8 v1, v1, -0x1

    .line 2458
    :cond_50
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method


# virtual methods
.method addScrapView(Landroid/view/View;I)V
    .registers 8
    .param p1, "scrap"    # Landroid/view/View;
    .param p2, "position"    # I

    .prologue
    .line 2347
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .line 2348
    .local v0, "lp":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    if-nez v0, :cond_9

    .line 2380
    :cond_8
    :goto_8
    return-void

    .line 2352
    :cond_9
    iput p2, v0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->position:I

    .line 2356
    iget v2, v0, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    .line 2357
    .local v2, "viewType":I
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->hasTransientState(Landroid/view/View;)Z

    move-result v1

    .line 2358
    .local v1, "scrapHasTransientState":Z
    invoke-virtual {p0, v2}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->shouldRecycleViewType(I)Z

    move-result v3

    if-eqz v3, :cond_19

    if-eqz v1, :cond_41

    .line 2359
    :cond_19
    const/4 v3, -0x2

    if-ne v2, v3, :cond_1e

    if-eqz v1, :cond_2e

    .line 2360
    :cond_1e
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    if-nez v3, :cond_29

    .line 2361
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    .line 2363
    :cond_29
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2365
    :cond_2e
    if-eqz v1, :cond_8

    .line 2366
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    if-nez v3, :cond_3b

    .line 2367
    new-instance v3, Landroid/support/v4/util/SparseArrayCompat;

    invoke-direct {v3}, Landroid/support/v4/util/SparseArrayCompat;-><init>()V

    iput-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    .line 2369
    :cond_3b
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v3, p2, p1}, Landroid/support/v4/util/SparseArrayCompat;->put(ILjava/lang/Object;)V

    goto :goto_8

    .line 2374
    :cond_41
    iget v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_4c

    .line 2375
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mCurrentScrap:Ljava/util/ArrayList;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 2378
    :cond_4c
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    aget-object v3, v3, v2

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method clear()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 2235
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_2a

    .line 2236
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mCurrentScrap:Ljava/util/ArrayList;

    .line 2237
    .local v2, "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 2238
    .local v3, "scrapCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    if-lt v0, v3, :cond_19

    .line 2252
    .end local v2    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v3    # "scrapCount":I
    :cond_f
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    if-eqz v5, :cond_18

    .line 2253
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v5}, Landroid/support/v4/util/SparseArrayCompat;->clear()V

    .line 2255
    :cond_18
    return-void

    .line 2239
    .restart local v2    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v3    # "scrapCount":I
    :cond_19
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    add-int/lit8 v5, v3, -0x1

    sub-int/2addr v5, v0

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->removeDetachedView(Landroid/view/View;Z)V
    invoke-static {v6, v5, v7}, Lcom/etsy/android/grid/ExtendableListView;->access$14(Lcom/etsy/android/grid/ExtendableListView;Landroid/view/View;Z)V

    .line 2238
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 2243
    .end local v0    # "i":I
    .end local v2    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v3    # "scrapCount":I
    :cond_2a
    iget v4, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    .line 2244
    .local v4, "typeCount":I
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2d
    if-ge v0, v4, :cond_f

    .line 2245
    iget-object v5, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    aget-object v2, v5, v0

    .line 2246
    .restart local v2    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 2247
    .restart local v3    # "scrapCount":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_38
    if-lt v1, v3, :cond_3d

    .line 2244
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 2248
    :cond_3d
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    add-int/lit8 v5, v3, -0x1

    sub-int/2addr v5, v1

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->removeDetachedView(Landroid/view/View;Z)V
    invoke-static {v6, v5, v7}, Lcom/etsy/android/grid/ExtendableListView;->access$14(Lcom/etsy/android/grid/ExtendableListView;Landroid/view/View;Z)V

    .line 2247
    add-int/lit8 v1, v1, 0x1

    goto :goto_38
.end method

.method clearTransientStateViews()V
    .registers 2

    .prologue
    .line 2318
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    if-eqz v0, :cond_9

    .line 2319
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v0}, Landroid/support/v4/util/SparseArrayCompat;->clear()V

    .line 2321
    :cond_9
    return-void
.end method

.method fillActiveViews(II)V
    .registers 9
    .param p1, "childCount"    # I
    .param p2, "firstActivePosition"    # I

    .prologue
    .line 2265
    iget-object v4, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    array-length v4, v4

    if-ge v4, p1, :cond_9

    .line 2266
    new-array v4, p1, [Landroid/view/View;

    iput-object v4, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    .line 2268
    :cond_9
    iput p2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mFirstActivePosition:I

    .line 2270
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    .line 2271
    .local v0, "activeViews":[Landroid/view/View;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_e
    if-lt v2, p1, :cond_11

    .line 2281
    return-void

    .line 2272
    :cond_11
    iget-object v4, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    invoke-virtual {v4, v2}, Lcom/etsy/android/grid/ExtendableListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 2273
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .line 2275
    .local v3, "lp":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    if-eqz v3, :cond_26

    iget v4, v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    const/4 v5, -0x2

    if-eq v4, v5, :cond_26

    .line 2278
    aput-object v1, v0, v2

    .line 2271
    :cond_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_e
.end method

.method getActiveView(I)Landroid/view/View;
    .registers 7
    .param p1, "position"    # I

    .prologue
    const/4 v3, 0x0

    .line 2291
    iget v4, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mFirstActivePosition:I

    sub-int v1, p1, v4

    .line 2292
    .local v1, "index":I
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    .line 2293
    .local v0, "activeViews":[Landroid/view/View;
    if-ltz v1, :cond_11

    array-length v4, v0

    if-ge v1, v4, :cond_11

    .line 2294
    aget-object v2, v0, v1

    .line 2295
    .local v2, "match":Landroid/view/View;
    aput-object v3, v0, v1

    .line 2298
    .end local v2    # "match":Landroid/view/View;
    :goto_10
    return-object v2

    :cond_11
    move-object v2, v3

    goto :goto_10
.end method

.method getScrapView(I)Landroid/view/View;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 2327
    iget v1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_c

    .line 2328
    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mCurrentScrap:Ljava/util/ArrayList;

    invoke-static {v1, p1}, Lcom/etsy/android/grid/ExtendableListView;->retrieveFromScrap(Ljava/util/ArrayList;I)Landroid/view/View;

    move-result-object v1

    .line 2336
    :goto_b
    return-object v1

    .line 2331
    :cond_c
    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v1, v1, Lcom/etsy/android/grid/ExtendableListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v0

    .line 2332
    .local v0, "whichScrap":I
    if-ltz v0, :cond_24

    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    array-length v1, v1

    if-ge v0, v1, :cond_24

    .line 2333
    iget-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    aget-object v1, v1, v0

    invoke-static {v1, p1}, Lcom/etsy/android/grid/ExtendableListView;->retrieveFromScrap(Ljava/util/ArrayList;I)Landroid/view/View;

    move-result-object v1

    goto :goto_b

    .line 2336
    :cond_24
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public markChildrenDirty()V
    .registers 9

    .prologue
    .line 2202
    iget v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_28

    .line 2203
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mCurrentScrap:Ljava/util/ArrayList;

    .line 2204
    .local v3, "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 2205
    .local v4, "scrapCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-lt v1, v4, :cond_1c

    .line 2219
    .end local v3    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v4    # "scrapCount":I
    :cond_e
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    if-eqz v6, :cond_1b

    .line 2220
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v6}, Landroid/support/v4/util/SparseArrayCompat;->size()I

    move-result v0

    .line 2221
    .local v0, "count":I
    const/4 v1, 0x0

    :goto_19
    if-lt v1, v0, :cond_47

    .line 2225
    .end local v0    # "count":I
    :cond_1b
    return-void

    .line 2206
    .restart local v3    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v4    # "scrapCount":I
    :cond_1c
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->forceLayout()V

    .line 2205
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 2210
    .end local v1    # "i":I
    .end local v3    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v4    # "scrapCount":I
    :cond_28
    iget v5, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    .line 2211
    .local v5, "typeCount":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_2b
    if-ge v1, v5, :cond_e

    .line 2212
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    aget-object v3, v6, v1

    .line 2213
    .restart local v3    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 2214
    .restart local v4    # "scrapCount":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_36
    if-lt v2, v4, :cond_3b

    .line 2211
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 2215
    :cond_3b
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->forceLayout()V

    .line 2214
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 2222
    .end local v2    # "j":I
    .end local v3    # "scrap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v4    # "scrapCount":I
    .end local v5    # "typeCount":I
    .restart local v0    # "count":I
    :cond_47
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v6, v1}, Landroid/support/v4/util/SparseArrayCompat;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->forceLayout()V

    .line 2221
    add-int/lit8 v1, v1, 0x1

    goto :goto_19
.end method

.method removeSkippedScrap()V
    .registers 6

    .prologue
    .line 2386
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    if-nez v2, :cond_5

    .line 2394
    :goto_4
    return-void

    .line 2389
    :cond_5
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 2390
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-lt v1, v0, :cond_14

    .line 2393
    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    goto :goto_4

    .line 2391
    :cond_14
    iget-object v3, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    iget-object v2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mSkippedScrap:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    const/4 v4, 0x0

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->removeDetachedView(Landroid/view/View;Z)V
    invoke-static {v3, v2, v4}, Lcom/etsy/android/grid/ExtendableListView;->access$14(Lcom/etsy/android/grid/ExtendableListView;Landroid/view/View;Z)V

    .line 2390
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method

.method scrapActiveViews()V
    .registers 13

    .prologue
    const/4 v4, 0x1

    const/4 v9, 0x0

    .line 2400
    iget-object v0, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mActiveViews:[Landroid/view/View;

    .line 2401
    .local v0, "activeViews":[Landroid/view/View;
    iget v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    if-le v10, v4, :cond_13

    .line 2403
    .local v4, "multipleScraps":Z
    :goto_8
    iget-object v6, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mCurrentScrap:Ljava/util/ArrayList;

    .line 2404
    .local v6, "scrapViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    array-length v1, v0

    .line 2405
    .local v1, "count":I
    add-int/lit8 v2, v1, -0x1

    .local v2, "i":I
    :goto_d
    if-gez v2, :cond_15

    .line 2436
    invoke-direct {p0}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->pruneScrapViews()V

    .line 2437
    return-void

    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v4    # "multipleScraps":Z
    .end local v6    # "scrapViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :cond_13
    move v4, v9

    .line 2401
    goto :goto_8

    .line 2406
    .restart local v1    # "count":I
    .restart local v2    # "i":I
    .restart local v4    # "multipleScraps":Z
    .restart local v6    # "scrapViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :cond_15
    aget-object v7, v0, v2

    .line 2407
    .local v7, "victim":Landroid/view/View;
    if-eqz v7, :cond_4f

    .line 2408
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;

    .line 2409
    .local v3, "lp":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    const/4 v10, 0x0

    aput-object v10, v0, v2

    .line 2411
    invoke-static {v7}, Landroid/support/v4/view/ViewCompat;->hasTransientState(Landroid/view/View;)Z

    move-result v5

    .line 2412
    .local v5, "scrapHasTransientState":Z
    iget v8, v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->viewType:I

    .line 2414
    .local v8, "viewType":I
    invoke-virtual {p0, v8}, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->shouldRecycleViewType(I)Z

    move-result v10

    if-eqz v10, :cond_30

    if-eqz v5, :cond_52

    .line 2416
    :cond_30
    const/4 v10, -0x2

    if-ne v8, v10, :cond_35

    if-eqz v5, :cond_3a

    .line 2417
    :cond_35
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->this$0:Lcom/etsy/android/grid/ExtendableListView;

    # invokes: Lcom/etsy/android/grid/ExtendableListView;->removeDetachedView(Landroid/view/View;Z)V
    invoke-static {v10, v7, v9}, Lcom/etsy/android/grid/ExtendableListView;->access$14(Lcom/etsy/android/grid/ExtendableListView;Landroid/view/View;Z)V

    .line 2419
    :cond_3a
    if-eqz v5, :cond_4f

    .line 2420
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    if-nez v10, :cond_47

    .line 2421
    new-instance v10, Landroid/support/v4/util/SparseArrayCompat;

    invoke-direct {v10}, Landroid/support/v4/util/SparseArrayCompat;-><init>()V

    iput-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    .line 2423
    :cond_47
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mTransientStateViews:Landroid/support/v4/util/SparseArrayCompat;

    iget v11, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mFirstActivePosition:I

    add-int/2addr v11, v2

    invoke-virtual {v10, v11, v7}, Landroid/support/v4/util/SparseArrayCompat;->put(ILjava/lang/Object;)V

    .line 2405
    .end local v3    # "lp":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .end local v5    # "scrapHasTransientState":Z
    .end local v8    # "viewType":I
    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, -0x1

    goto :goto_d

    .line 2428
    .restart local v3    # "lp":Lcom/etsy/android/grid/ExtendableListView$LayoutParams;
    .restart local v5    # "scrapHasTransientState":Z
    .restart local v8    # "viewType":I
    :cond_52
    if-eqz v4, :cond_58

    .line 2429
    iget-object v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    aget-object v6, v10, v8

    .line 2431
    :cond_58
    iget v10, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mFirstActivePosition:I

    add-int/2addr v10, v2

    iput v10, v3, Lcom/etsy/android/grid/ExtendableListView$LayoutParams;->position:I

    .line 2432
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4f
.end method

.method public setViewTypeCount(I)V
    .registers 6
    .param p1, "viewTypeCount"    # I

    .prologue
    .line 2188
    const/4 v2, 0x1

    if-ge p1, v2, :cond_b

    .line 2189
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Can\'t have a viewTypeCount < 1"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 2192
    :cond_b
    new-array v1, p1, [Ljava/util/ArrayList;

    .line 2193
    .local v1, "scrapViews":[Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    if-lt v0, p1, :cond_1a

    .line 2196
    iput p1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mViewTypeCount:I

    .line 2197
    const/4 v2, 0x0

    aget-object v2, v1, v2

    iput-object v2, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mCurrentScrap:Ljava/util/ArrayList;

    .line 2198
    iput-object v1, p0, Lcom/etsy/android/grid/ExtendableListView$RecycleBin;->mScrapViews:[Ljava/util/ArrayList;

    .line 2199
    return-void

    .line 2194
    :cond_1a
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    aput-object v2, v1, v0

    .line 2193
    add-int/lit8 v0, v0, 0x1

    goto :goto_e
.end method

.method public shouldRecycleViewType(I)Z
    .registers 3
    .param p1, "viewType"    # I

    .prologue
    .line 2228
    if-ltz p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method
