.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "SimpleSectionedRecyclerViewAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private _totalItemsCount:I

.field private final mContext:Landroid/content/Context;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mSectionInfoValid:Z

.field private mSections:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;Landroid/content/Context;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 305
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 298
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSectionInfoValid:Z

    .line 301
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSections:Landroid/util/SparseArray;

    .line 303
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->_totalItemsCount:I

    .line 306
    const-string v0, "layout_inflater"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 307
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mContext:Landroid/content/Context;

    .line 308
    return-void
.end method

.method private buildSectionInformation()V
    .registers 9

    .prologue
    .line 485
    iget-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSectionInfoValid:Z

    if-eqz v7, :cond_5

    .line 504
    :goto_4
    return-void

    .line 488
    :cond_5
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getSectionCount()I

    move-result v3

    .line 489
    .local v3, "numSections":I
    new-array v5, v3, [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    .line 490
    .local v5, "sections":[Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
    const/4 v2, 0x0

    .line 491
    .local v2, "nextOffset":I
    const/4 v6, 0x0

    .line 492
    .local v6, "totalItems":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    if-ge v0, v3, :cond_20

    .line 493
    new-instance v4, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    invoke-direct {v4, p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;I)V

    .line 494
    .local v4, "section":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
    aput-object v4, v5, v0

    .line 496
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getNumOfItemsInSection(I)I

    move-result v1

    .line 497
    .local v1, "itemsInSection":I
    add-int/2addr v2, v1

    .line 498
    add-int/2addr v6, v1

    .line 492
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 500
    .end local v1    # "itemsInSection":I
    .end local v4    # "section":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
    :cond_20
    add-int/2addr v6, v3

    .line 501
    iput v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->_totalItemsCount:I

    .line 502
    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->setSections([Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;)V

    .line 503
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSectionInfoValid:Z

    goto :goto_4
.end method


# virtual methods
.method protected abstract calculateItemLayoutProperties(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;)V
.end method

.method protected abstract createViewHolderOfType(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 476
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->buildSectionInformation()V

    .line 477
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getTotalItemCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 471
    const v0, 0x7fffffff

    sub-int/2addr v0, p1

    int-to-long v0, v0

    return-wide v0
.end method

.method public getItemPositionDataFromGlobalPosition(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;
    .registers 9
    .param p1, "globalPosition"    # I

    .prologue
    .line 412
    const/4 v4, 0x0

    .line 413
    .local v4, "sectionNum":I
    const/4 v1, 0x0

    .line 414
    .local v1, "isSection":Z
    const/4 v3, -0x1

    .line 416
    .local v3, "posWithinSection":I
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v6

    add-int/lit8 v0, v6, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1b

    .line 417
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v6, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    iget v5, v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->sectionedPosition:I

    .line 418
    .local v5, "sectionedPos":I
    move v4, v0

    .line 419
    if-ne v5, p1, :cond_27

    .line 420
    const/4 v1, 0x1

    .line 429
    .end local v5    # "sectionedPos":I
    :cond_1b
    :goto_1b
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;)V

    .line 430
    .local v2, "itemPositionData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;
    iput v4, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->sectionNum:I

    .line 431
    iput v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->positionWithinSection:I

    .line 432
    iput-boolean v1, v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->isSectionHeader:Z

    .line 434
    return-object v2

    .line 423
    .end local v2    # "itemPositionData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;
    .restart local v5    # "sectionedPos":I
    :cond_27
    if-ge v5, p1, :cond_2e

    .line 424
    sub-int v6, p1, v5

    add-int/lit8 v3, v6, -0x1

    .line 425
    goto :goto_1b

    .line 416
    :cond_2e
    add-int/lit8 v0, v0, -0x1

    goto :goto_b
.end method

.method public getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 345
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getItemPositionDataFromGlobalPosition(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;

    move-result-object v0

    .line 346
    .local v0, "itemPositionData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;
    const/4 v1, 0x0

    .line 347
    .local v1, "viewType":I
    iget-boolean v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->isSectionHeader:Z

    if-eqz v2, :cond_10

    .line 348
    iget v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->sectionNum:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getSectionViewType(I)I

    move-result v1

    .line 353
    :goto_f
    return v1

    .line 351
    :cond_10
    iget v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->sectionNum:I

    iget v3, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->positionWithinSection:I

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getSectionItemViewType(II)I

    move-result v1

    goto :goto_f
.end method

.method protected abstract getNumOfItemsInSection(I)I
.end method

.method protected abstract getSectionCount()I
.end method

.method protected abstract getSectionItemViewType(II)I
.end method

.method protected abstract getSectionViewType(I)I
.end method

.method protected getTotalItemCount()I
    .registers 2

    .prologue
    .line 481
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->_totalItemsCount:I

    return v0
.end method

.method public invalidateAdapter()V
    .registers 2

    .prologue
    .line 507
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSectionInfoValid:Z

    .line 508
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->notifyDataSetChanged()V

    .line 509
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 6
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 329
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->getItemPositionDataFromGlobalPosition(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;

    move-result-object v0

    .line 331
    .local v0, "itemPositionData":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;
    iget-boolean v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->isSectionHeader:Z

    if-eqz v1, :cond_16

    .line 332
    iget v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->sectionNum:I

    invoke-virtual {p0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->onBindViewHolderOfSection(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 337
    :goto_d
    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->calculateItemLayoutProperties(Landroid/support/v7/widget/RecyclerView$ViewHolder;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;)V

    .line 338
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 339
    return-void

    .line 334
    :cond_16
    iget v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->sectionNum:I

    iget v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$ItemPositionData;->positionWithinSection:I

    invoke-virtual {p0, p1, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->onBindViewHolderOfSectionItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;II)V

    goto :goto_d
.end method

.method protected abstract onBindViewHolderOfSection(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end method

.method protected abstract onBindViewHolderOfSectionItem(Landroid/support/v7/widget/RecyclerView$ViewHolder;II)V
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "typeView"    # I

    .prologue
    .line 322
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->createViewHolderOfType(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public setSections([Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;)V
    .registers 8
    .param p1, "sections"    # [Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    .prologue
    .line 376
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSections:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->clear()V

    .line 378
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$1;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;)V

    invoke-static {p1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 387
    const/4 v0, 0x0

    .line 388
    .local v0, "offset":I
    array-length v3, p1

    const/4 v2, 0x0

    :goto_10
    if-ge v2, v3, :cond_25

    aget-object v1, p1, v2

    .line 389
    .local v1, "section":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
    iget v4, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->firstPosition:I

    add-int/2addr v4, v0

    iput v4, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->sectionedPosition:I

    .line 390
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->mSections:Landroid/util/SparseArray;

    iget v5, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->sectionedPosition:I

    invoke-virtual {v4, v5, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 391
    add-int/lit8 v0, v0, 0x1

    .line 388
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 394
    .end local v1    # "section":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
    :cond_25
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->notifyDataSetChanged()V

    .line 395
    return-void
.end method
