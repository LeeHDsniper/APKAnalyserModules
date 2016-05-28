.class public final Landroid/support/v7/widget/RecyclerView$Recycler;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Recycler"
.end annotation


# instance fields
.field final mAttachedScrap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field final mCachedViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mChangedScrap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

.field private final mUnmodifiableAttachedScrap:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mViewCacheExtension:Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;

.field private mViewCacheMax:I

.field final synthetic this$0:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3

    .prologue
    .line 4151
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    .line 4153
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    .line 4155
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    .line 4157
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mUnmodifiableAttachedScrap:Ljava/util/List;

    .line 4160
    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheMax:I

    return-void
.end method

.method static synthetic access$1800(Landroid/support/v7/widget/RecyclerView$Recycler;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$Recycler;

    .prologue
    .line 4151
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    return-object v0
.end method

.method private attachAccessibilityDelegate(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 4458
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3800(Landroid/support/v7/widget/RecyclerView;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v0

    if-eqz v0, :cond_31

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAccessibilityManager:Landroid/view/accessibility/AccessibilityManager;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3800(Landroid/support/v7/widget/RecyclerView;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 4459
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v0

    if-nez v0, :cond_1e

    .line 4461
    const/4 v0, 0x1

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 4464
    :cond_1e
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->hasAccessibilityDelegate(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_31

    .line 4465
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAccessibilityDelegate:Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$3900(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerViewAccessibilityDelegate;->getItemDelegate()Landroid/support/v4/view/AccessibilityDelegateCompat;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 4469
    :cond_31
    return-void
.end method

.method private invalidateDisplayListInt(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 4472
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_e

    .line 4473
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->invalidateDisplayListInt(Landroid/view/ViewGroup;Z)V

    .line 4475
    :cond_e
    return-void
.end method

.method private invalidateDisplayListInt(Landroid/view/ViewGroup;Z)V
    .registers 8
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "invalidateThis"    # Z

    .prologue
    const/4 v4, 0x4

    .line 4478
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_7
    if-ltz v0, :cond_1a

    .line 4479
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 4480
    .local v1, "view":Landroid/view/View;
    instance-of v3, v1, Landroid/view/ViewGroup;

    if-eqz v3, :cond_17

    .line 4481
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "view":Landroid/view/View;
    const/4 v3, 0x1

    invoke-direct {p0, v1, v3}, Landroid/support/v7/widget/RecyclerView$Recycler;->invalidateDisplayListInt(Landroid/view/ViewGroup;Z)V

    .line 4478
    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    .line 4484
    :cond_1a
    if-nez p2, :cond_1d

    .line 4496
    :goto_1c
    return-void

    .line 4488
    :cond_1d
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v3

    if-ne v3, v4, :cond_2b

    .line 4489
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 4490
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_1c

    .line 4492
    :cond_2b
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getVisibility()I

    move-result v2

    .line 4493
    .local v2, "visibility":I
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 4494
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_1c
.end method


# virtual methods
.method addViewHolderToRecycledViewPool(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v1, 0x0

    .line 4627
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 4628
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->dispatchViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4629
    iput-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 4630
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->putRecycledView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4631
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 4173
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4174
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleAndClearCachedViews()V

    .line 4175
    return-void
.end method

.method clearOldPositions()V
    .registers 7

    .prologue
    .line 4993
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4994
    .local v0, "cachedCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_7
    if-ge v3, v0, :cond_17

    .line 4995
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4996
    .local v2, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearOldPosition()V

    .line 4994
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 4998
    .end local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_17
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 4999
    .local v4, "scrapCount":I
    const/4 v3, 0x0

    :goto_1e
    if-ge v3, v4, :cond_2e

    .line 5000
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearOldPosition()V

    .line 4999
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 5002
    :cond_2e
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    if-eqz v5, :cond_49

    .line 5003
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 5004
    .local v1, "changedScrapCount":I
    const/4 v3, 0x0

    :goto_39
    if-ge v3, v1, :cond_49

    .line 5005
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearOldPosition()V

    .line 5004
    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    .line 5008
    .end local v1    # "changedScrapCount":I
    :cond_49
    return-void
.end method

.method clearScrap()V
    .registers 2

    .prologue
    .line 4697
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4698
    return-void
.end method

.method public convertPreLayoutPositionToPostLayout(I)I
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 4301
    if-ltz p1, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_3d

    .line 4302
    :cond_c
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". State "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "item count is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, v2, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 4305
    :cond_3d
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_48

    .line 4308
    .end local p1    # "position":I
    :goto_47
    return p1

    .restart local p1    # "position":I
    :cond_48
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(I)I

    move-result p1

    goto :goto_47
.end method

.method dispatchViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 4838
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mRecyclerListener:Landroid/support/v7/widget/RecyclerView$RecyclerListener;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$4200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$RecyclerListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 4839
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mRecyclerListener:Landroid/support/v7/widget/RecyclerView$RecyclerListener;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$4200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$RecyclerListener;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/support/v7/widget/RecyclerView$RecyclerListener;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4841
    :cond_11
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 4842
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4844
    :cond_22
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    if-eqz v0, :cond_2f

    .line 4845
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$State;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4848
    :cond_2f
    return-void
.end method

.method getChangedScrapViewForPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 13
    .param p1, "position"    # I

    .prologue
    const/4 v6, 0x0

    const/16 v10, 0x20

    .line 4703
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    if-eqz v7, :cond_f

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "changedScrapSize":I
    if-nez v0, :cond_11

    .end local v0    # "changedScrapSize":I
    :cond_f
    move-object v1, v6

    .line 4728
    :goto_10
    return-object v1

    .line 4707
    .restart local v0    # "changedScrapSize":I
    :cond_11
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_12
    if-ge v2, v0, :cond_2f

    .line 4708
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4709
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v7

    if-nez v7, :cond_2c

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v7

    if-ne v7, p1, :cond_2c

    .line 4710
    invoke-virtual {v1, v10}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto :goto_10

    .line 4707
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 4715
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_2f
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v7

    if-eqz v7, :cond_7b

    .line 4716
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v7, v7, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v7, p1}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(I)I

    move-result v3

    .line 4717
    .local v3, "offsetPosition":I
    if-lez v3, :cond_7b

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v7

    if-ge v3, v7, :cond_7b

    .line 4718
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v4

    .line 4719
    .local v4, "id":J
    const/4 v2, 0x0

    :goto_5c
    if-ge v2, v0, :cond_7b

    .line 4720
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4721
    .restart local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v7

    if-nez v7, :cond_78

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v8

    cmp-long v7, v8, v4

    if-nez v7, :cond_78

    .line 4722
    invoke-virtual {v1, v10}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto :goto_10

    .line 4719
    :cond_78
    add-int/lit8 v2, v2, 0x1

    goto :goto_5c

    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v3    # "offsetPosition":I
    .end local v4    # "id":J
    :cond_7b
    move-object v1, v6

    .line 4728
    goto :goto_10
.end method

.method getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;
    .registers 2

    .prologue
    .line 4942
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    if-nez v0, :cond_b

    .line 4943
    new-instance v0, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    invoke-direct {v0}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    .line 4945
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    return-object v0
.end method

.method getScrapCount()I
    .registers 2

    .prologue
    .line 4689
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getScrapList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4196
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mUnmodifiableAttachedScrap:Ljava/util/List;

    return-object v0
.end method

.method getScrapViewAt(I)Landroid/view/View;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 4693
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    return-object v0
.end method

.method getScrapViewForId(JIZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 12
    .param p1, "id"    # J
    .param p3, "type"    # I
    .param p4, "dryRun"    # Z

    .prologue
    .line 4789
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 4790
    .local v1, "count":I
    add-int/lit8 v3, v1, -0x1

    .local v3, "i":I
    :goto_8
    if-ltz v3, :cond_59

    .line 4791
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4792
    .local v2, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v4

    cmp-long v4, v4, p1

    if-nez v4, :cond_56

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v4

    if-nez v4, :cond_56

    .line 4793
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v4

    if-ne p3, v4, :cond_42

    .line 4794
    const/16 v4, 0x20

    invoke-virtual {v2, v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 4795
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 4804
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v4

    if-nez v4, :cond_41

    .line 4805
    const/4 v4, 0x2

    const/16 v5, 0xe

    invoke-virtual {v2, v4, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setFlags(II)V

    .line 4834
    .end local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_41
    :goto_41
    return-object v2

    .line 4810
    .restart local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_42
    if-nez p4, :cond_56

    .line 4812
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 4813
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/support/v7/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 4814
    iget-object v4, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/RecyclerView$Recycler;->quickRecycleScrapView(Landroid/view/View;)V

    .line 4790
    :cond_56
    add-int/lit8 v3, v3, -0x1

    goto :goto_8

    .line 4820
    .end local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_59
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4821
    .local v0, "cacheSize":I
    add-int/lit8 v3, v0, -0x1

    :goto_61
    if-ltz v3, :cond_89

    .line 4822
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4823
    .restart local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v4

    cmp-long v4, v4, p1

    if-nez v4, :cond_86

    .line 4824
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v4

    if-ne p3, v4, :cond_81

    .line 4825
    if-nez p4, :cond_41

    .line 4826
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_41

    .line 4829
    :cond_81
    if-nez p4, :cond_86

    .line 4830
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    .line 4821
    :cond_86
    add-int/lit8 v3, v3, -0x1

    goto :goto_61

    .line 4834
    .end local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_89
    const/4 v2, 0x0

    goto :goto_41
.end method

.method getScrapViewForPosition(IIZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 12
    .param p1, "position"    # I
    .param p2, "type"    # I
    .param p3, "dryRun"    # Z

    .prologue
    .line 4741
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 4744
    .local v3, "scrapCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v3, :cond_78

    .line 4745
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4746
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v5

    if-nez v5, :cond_bc

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v5

    if-ne v5, p1, :cond_bc

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v5

    if-nez v5, :cond_bc

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, v5, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    # getter for: Landroid/support/v7/widget/RecyclerView$State;->mInPreLayout:Z
    invoke-static {v5}, Landroid/support/v7/widget/RecyclerView$State;->access$1500(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v5

    if-nez v5, :cond_33

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v5

    if-nez v5, :cond_bc

    .line 4748
    :cond_33
    const/4 v5, -0x1

    if-eq p2, v5, :cond_b6

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v5

    if-eq v5, p2, :cond_b6

    .line 4749
    const-string v5, "RecyclerView"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Scrap view for position "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " isn\'t dirty but has"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " wrong view type! (found "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " but expected "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4759
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_78
    if-nez p3, :cond_91

    .line 4760
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, v5, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v5, p1, p2}, Landroid/support/v7/widget/ChildHelper;->findHiddenNonRemovedView(II)Landroid/view/View;

    move-result-object v4

    .line 4761
    .local v4, "view":Landroid/view/View;
    if-eqz v4, :cond_91

    .line 4763
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, v5, Landroid/support/v7/widget/RecyclerView;->mItemAnimator:Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6, v4}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->endAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4768
    .end local v4    # "view":Landroid/view/View;
    :cond_91
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4769
    .local v0, "cacheSize":I
    const/4 v2, 0x0

    :goto_98
    if-ge v2, v0, :cond_c3

    .line 4770
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4773
    .restart local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v5

    if-nez v5, :cond_c0

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v5

    if-ne v5, p1, :cond_c0

    .line 4774
    if-nez p3, :cond_b5

    .line 4775
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 4784
    .end local v0    # "cacheSize":I
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_b5
    :goto_b5
    return-object v1

    .line 4754
    .restart local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_b6
    const/16 v5, 0x20

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    goto :goto_b5

    .line 4744
    :cond_bc
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7

    .line 4769
    .restart local v0    # "cacheSize":I
    :cond_c0
    add-int/lit8 v2, v2, 0x1

    goto :goto_98

    .line 4784
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_c3
    const/4 v1, 0x0

    goto :goto_b5
.end method

.method public getViewForPosition(I)Landroid/view/View;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 4326
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->getViewForPosition(IZ)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method getViewForPosition(IZ)Landroid/view/View;
    .registers 15
    .param p1, "position"    # I
    .param p2, "dryRun"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 4330
    if-ltz p1, :cond_e

    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v10

    if-lt p1, v10, :cond_43

    .line 4331
    :cond_e
    new-instance v8, Ljava/lang/IndexOutOfBoundsException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalid item position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "). Item count:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 4334
    :cond_43
    const/4 v1, 0x0

    .line 4335
    .local v1, "fromScrap":Z
    const/4 v2, 0x0

    .line 4337
    .local v2, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v10

    if-eqz v10, :cond_56

    .line 4338
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->getChangedScrapViewForPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 4339
    if-eqz v2, :cond_d2

    move v1, v8

    .line 4342
    :cond_56
    :goto_56
    if-nez v2, :cond_7f

    .line 4343
    const/4 v10, -0x1

    invoke-virtual {p0, p1, v10, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->getScrapViewForPosition(IIZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 4344
    if-eqz v2, :cond_7f

    .line 4345
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView$Recycler;->validateViewHolderForOffsetPosition(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v10

    if-nez v10, :cond_de

    .line 4347
    if-nez p2, :cond_7e

    .line 4350
    const/4 v10, 0x4

    invoke-virtual {v2, v10}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 4351
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v10

    if-eqz v10, :cond_d4

    .line 4352
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v11, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10, v11, v9}, Landroid/support/v7/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 4353
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->unScrap()V

    .line 4357
    :cond_7b
    :goto_7b
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4359
    :cond_7e
    const/4 v2, 0x0

    .line 4365
    :cond_7f
    :goto_7f
    if-nez v2, :cond_15b

    .line 4366
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v10, p1}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(I)I

    move-result v4

    .line 4367
    .local v4, "offsetPosition":I
    if-ltz v4, :cond_97

    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v10}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v10

    if-lt v4, v10, :cond_e0

    .line 4368
    :cond_97
    new-instance v8, Ljava/lang/IndexOutOfBoundsException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Inconsistency detected. Invalid item position "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "(offset:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ")."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "state:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v8

    .end local v4    # "offsetPosition":I
    :cond_d2
    move v1, v9

    .line 4339
    goto :goto_56

    .line 4354
    :cond_d4
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v10

    if-eqz v10, :cond_7b

    .line 4355
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    goto :goto_7b

    .line 4361
    :cond_de
    const/4 v1, 0x1

    goto :goto_7f

    .line 4373
    .restart local v4    # "offsetPosition":I
    :cond_e0
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v10}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v10

    invoke-virtual {v10, v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v6

    .line 4375
    .local v6, "type":I
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v10}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v10

    if-eqz v10, :cond_109

    .line 4376
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v10}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v10

    invoke-virtual {v10, v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v10

    invoke-virtual {p0, v10, v11, v6, p2}, Landroid/support/v7/widget/RecyclerView$Recycler;->getScrapViewForId(JIZ)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 4377
    if-eqz v2, :cond_109

    .line 4379
    iput v4, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    .line 4380
    const/4 v1, 0x1

    .line 4383
    :cond_109
    if-nez v2, :cond_135

    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheExtension:Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;

    if-eqz v10, :cond_135

    .line 4386
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheExtension:Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;

    invoke-virtual {v10, p0, p1, v6}, Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;->getViewForPositionAndType(Landroid/support/v7/widget/RecyclerView$Recycler;II)Landroid/view/View;

    move-result-object v7

    .line 4388
    .local v7, "view":Landroid/view/View;
    if-eqz v7, :cond_135

    .line 4389
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10, v7}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 4390
    if-nez v2, :cond_127

    .line 4391
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "getViewForPositionAndType returned a view which does not have a ViewHolder"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 4393
    :cond_127
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v10

    if-eqz v10, :cond_135

    .line 4394
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "getViewForPositionAndType returned a view that is ignored. You must call stopIgnoring before returning this view."

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 4400
    .end local v7    # "view":Landroid/view/View;
    :cond_135
    if-nez v2, :cond_14d

    .line 4407
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v10

    invoke-virtual {v10, v6}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->getRecycledView(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 4408
    if-eqz v2, :cond_14d

    .line 4409
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->resetInternal()V

    .line 4410
    # getter for: Landroid/support/v7/widget/RecyclerView;->FORCE_INVALIDATE_DISPLAY_LIST:Z
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$3700()Z

    move-result v10

    if-eqz v10, :cond_14d

    .line 4411
    invoke-direct {p0, v2}, Landroid/support/v7/widget/RecyclerView$Recycler;->invalidateDisplayListInt(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4415
    :cond_14d
    if-nez v2, :cond_15b

    .line 4416
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v10}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v10

    iget-object v11, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10, v11, v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->createViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    .line 4422
    .end local v4    # "offsetPosition":I
    .end local v6    # "type":I
    :cond_15b
    const/4 v0, 0x0

    .line 4423
    .local v0, "bound":Z
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v10

    if-eqz v10, :cond_18e

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isBound()Z

    move-result v10

    if-eqz v10, :cond_18e

    .line 4425
    iput p1, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    .line 4441
    :cond_16e
    :goto_16e
    iget-object v10, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 4443
    .local v3, "lp":Landroid/view/ViewGroup$LayoutParams;
    if-nez v3, :cond_1c8

    .line 4444
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 4445
    .local v5, "rvLayoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iget-object v10, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 4452
    :goto_183
    iput-object v2, v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4453
    if-eqz v1, :cond_1e2

    if-eqz v0, :cond_1e2

    :goto_189
    iput-boolean v8, v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mPendingInvalidate:Z

    .line 4454
    iget-object v8, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    return-object v8

    .line 4426
    .end local v3    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .end local v5    # "rvLayoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_18e
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isBound()Z

    move-result v10

    if-eqz v10, :cond_1a0

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->needsUpdate()Z

    move-result v10

    if-nez v10, :cond_1a0

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v10

    if-eqz v10, :cond_16e

    .line 4431
    :cond_1a0
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mAdapterHelper:Landroid/support/v7/widget/AdapterHelper;

    invoke-virtual {v10, p1}, Landroid/support/v7/widget/AdapterHelper;->findPositionOffset(I)I

    move-result v4

    .line 4432
    .restart local v4    # "offsetPosition":I
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iput-object v10, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 4433
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v10}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v10

    invoke-virtual {v10, v2, v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->bindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 4434
    iget-object v10, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-direct {p0, v10}, Landroid/support/v7/widget/RecyclerView$Recycler;->attachAccessibilityDelegate(Landroid/view/View;)V

    .line 4435
    const/4 v0, 0x1

    .line 4436
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v10

    if-eqz v10, :cond_16e

    .line 4437
    iput p1, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPreLayoutPosition:I

    goto :goto_16e

    .line 4446
    .end local v4    # "offsetPosition":I
    .restart local v3    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_1c8
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10, v3}, Landroid/support/v7/widget/RecyclerView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result v10

    if-nez v10, :cond_1de

    .line 4447
    iget-object v10, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10, v3}, Landroid/support/v7/widget/RecyclerView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 4448
    .restart local v5    # "rvLayoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    iget-object v10, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_183

    .end local v5    # "rvLayoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_1de
    move-object v5, v3

    .line 4450
    check-cast v5, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .restart local v5    # "rvLayoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    goto :goto_183

    :cond_1e2
    move v8, v9

    .line 4453
    goto :goto_189
.end method

.method markItemDecorInsetsDirty()V
    .registers 6

    .prologue
    .line 5011
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 5012
    .local v0, "cachedCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v0, :cond_21

    .line 5013
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 5014
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    iget-object v4, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    .line 5015
    .local v3, "layoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    if-eqz v3, :cond_1e

    .line 5016
    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;->mInsetsDirty:Z

    .line 5012
    :cond_1e
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 5019
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v3    # "layoutParams":Landroid/support/v7/widget/RecyclerView$LayoutParams;
    :cond_21
    return-void
.end method

.method markKnownViewsInvalid()V
    .registers 5

    .prologue
    .line 4978
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    if-eqz v3, :cond_2e

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 4979
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4980
    .local v0, "cachedCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1b
    if-ge v2, v0, :cond_31

    .line 4981
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4982
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_2b

    .line 4983
    const/4 v3, 0x6

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 4980
    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 4988
    .end local v0    # "cachedCount":I
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v2    # "i":I
    :cond_2e
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleAndClearCachedViews()V

    .line 4990
    :cond_31
    return-void
.end method

.method offsetPositionRecordsForInsert(II)V
    .registers 7
    .param p1, "insertedAt"    # I
    .param p2, "count"    # I

    .prologue
    .line 4886
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4887
    .local v0, "cachedCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v0, :cond_20

    .line 4888
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4889
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_1d

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v3

    if-lt v3, p1, :cond_1d

    .line 4894
    const/4 v3, 0x1

    invoke-virtual {v1, p2, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    .line 4887
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 4897
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_20
    return-void
.end method

.method offsetPositionRecordsForMove(II)V
    .registers 11
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    const/4 v7, 0x0

    .line 4858
    if-ge p1, p2, :cond_24

    .line 4859
    move v5, p1

    .line 4860
    .local v5, "start":I
    move v1, p2

    .line 4861
    .local v1, "end":I
    const/4 v4, -0x1

    .line 4867
    .local v4, "inBetweenOffset":I
    :goto_6
    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4868
    .local v0, "cachedCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    if-ge v3, v0, :cond_36

    .line 4869
    iget-object v6, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4870
    .local v2, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v2, :cond_21

    iget v6, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-lt v6, v5, :cond_21

    iget v6, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-le v6, v1, :cond_28

    .line 4868
    :cond_21
    :goto_21
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 4863
    .end local v0    # "cachedCount":I
    .end local v1    # "end":I
    .end local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v3    # "i":I
    .end local v4    # "inBetweenOffset":I
    .end local v5    # "start":I
    :cond_24
    move v5, p2

    .line 4864
    .restart local v5    # "start":I
    move v1, p1

    .line 4865
    .restart local v1    # "end":I
    const/4 v4, 0x1

    .restart local v4    # "inBetweenOffset":I
    goto :goto_6

    .line 4873
    .restart local v0    # "cachedCount":I
    .restart local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .restart local v3    # "i":I
    :cond_28
    iget v6, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-ne v6, p1, :cond_32

    .line 4874
    sub-int v6, p2, p1

    invoke-virtual {v2, v6, v7}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    goto :goto_21

    .line 4876
    :cond_32
    invoke-virtual {v2, v4, v7}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    goto :goto_21

    .line 4883
    .end local v2    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_36
    return-void
.end method

.method offsetPositionRecordsForRemove(IIZ)V
    .registers 9
    .param p1, "removedFrom"    # I
    .param p2, "count"    # I
    .param p3, "applyToPreLayout"    # Z

    .prologue
    .line 4906
    add-int v3, p1, p2

    .line 4907
    .local v3, "removedEnd":I
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4908
    .local v0, "cachedCount":I
    add-int/lit8 v2, v0, -0x1

    .local v2, "i":I
    :goto_a
    if-ltz v2, :cond_32

    .line 4909
    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4910
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_20

    .line 4911
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v4

    if-lt v4, v3, :cond_23

    .line 4917
    neg-int v4, p2

    invoke-virtual {v1, v4, p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->offsetPosition(IZ)V

    .line 4908
    :cond_20
    :goto_20
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 4918
    :cond_23
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v4

    if-lt v4, p1, :cond_20

    .line 4920
    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 4921
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    goto :goto_20

    .line 4925
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_32
    return-void
.end method

.method onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;Z)V
    .registers 5
    .param p1, "oldAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p2, "newAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p3, "compatibleWithPrevious"    # Z

    .prologue
    .line 4852
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->clear()V

    .line 4853
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$Recycler;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->onAdapterChanged(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/support/v7/widget/RecyclerView$Adapter;Z)V

    .line 4854
    return-void
.end method

.method quickRecycleScrapView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 4639
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 4640
    .local v0, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    const/4 v1, 0x0

    # setter for: Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->access$4102(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/support/v7/widget/RecyclerView$Recycler;

    .line 4641
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    .line 4642
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4643
    return-void
.end method

.method recycleAndClearCachedViews()V
    .registers 4

    .prologue
    .line 4533
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4534
    .local v0, "count":I
    add-int/lit8 v1, v0, -0x1

    .local v1, "i":I
    :goto_8
    if-ltz v1, :cond_10

    .line 4535
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    .line 4534
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    .line 4537
    :cond_10
    iget-object v2, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 4538
    return-void
.end method

.method recycleCachedViewAt(I)V
    .registers 4
    .param p1, "cachedViewIndex"    # I

    .prologue
    .line 4555
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4559
    .local v0, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->addViewHolderToRecycledViewPool(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4560
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 4561
    return-void
.end method

.method public recycleView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 4511
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 4512
    .local v0, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 4513
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/support/v7/widget/RecyclerView;->removeDetachedView(Landroid/view/View;Z)V

    .line 4515
    :cond_10
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 4516
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->unScrap()V

    .line 4520
    :cond_19
    :goto_19
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleViewHolderInternal(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4521
    return-void

    .line 4517
    :cond_1d
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->wasReturnedFromScrap()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 4518
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    goto :goto_19
.end method

.method recycleViewHolderInternal(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 12
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 4569
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v7

    if-nez v7, :cond_10

    iget-object v7, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    if-eqz v7, :cond_41

    .line 4570
    :cond_10
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Scrapped or attached views may not be recycled. isScrap:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isScrap()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " isAttached:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    if-eqz v9, :cond_3f

    :goto_33
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v7, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    :cond_3f
    move v5, v6

    goto :goto_33

    .line 4576
    :cond_41
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isTmpDetached()Z

    move-result v7

    if-eqz v7, :cond_60

    .line 4577
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Tmp detached view should be removed from RecyclerView before it can be recycled: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 4581
    :cond_60
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->shouldIgnore()Z

    move-result v7

    if-eqz v7, :cond_6e

    .line 4582
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Trying to recycle an ignored view holder. You should first call stopIgnoringView(view) before calling recycle."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 4586
    :cond_6e
    # invokes: Landroid/support/v7/widget/RecyclerView$ViewHolder;->doesTransientStatePreventRecycling()Z
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->access$4000(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v4

    .line 4588
    .local v4, "transientStatePreventsRecycling":Z
    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v7

    if-eqz v7, :cond_cb

    if-eqz v4, :cond_cb

    iget-object v7, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v7}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v7

    invoke-virtual {v7, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v7

    if-eqz v7, :cond_cb

    move v2, v5

    .line 4591
    .local v2, "forceRecycle":Z
    :goto_89
    const/4 v0, 0x0

    .line 4592
    .local v0, "cached":Z
    const/4 v3, 0x0

    .line 4597
    .local v3, "recycled":Z
    if-nez v2, :cond_93

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRecyclable()Z

    move-result v5

    if-eqz v5, :cond_ba

    .line 4598
    :cond_93
    const/16 v5, 0x4e

    invoke-virtual {p1, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->hasAnyOfTheFlags(I)Z

    move-result v5

    if-nez v5, :cond_b4

    .line 4601
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 4602
    .local v1, "cachedViewSize":I
    iget v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheMax:I

    if-ne v1, v5, :cond_aa

    if-lez v1, :cond_aa

    .line 4603
    invoke-virtual {p0, v6}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    .line 4605
    :cond_aa
    iget v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheMax:I

    if-ge v1, v5, :cond_b4

    .line 4606
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4607
    const/4 v0, 0x1

    .line 4610
    .end local v1    # "cachedViewSize":I
    :cond_b4
    if-nez v0, :cond_ba

    .line 4611
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView$Recycler;->addViewHolderToRecycledViewPool(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4612
    const/4 v3, 0x1

    .line 4620
    :cond_ba
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, v5, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v5, p1}, Landroid/support/v7/widget/RecyclerView$State;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 4621
    if-nez v0, :cond_ca

    if-nez v3, :cond_ca

    if-eqz v4, :cond_ca

    .line 4622
    const/4 v5, 0x0

    iput-object v5, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mOwnerRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 4624
    :cond_ca
    return-void

    .end local v0    # "cached":Z
    .end local v2    # "forceRecycle":Z
    .end local v3    # "recycled":Z
    :cond_cb
    move v2, v6

    .line 4588
    goto :goto_89
.end method

.method scrapView(Landroid/view/View;)V
    .registers 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 4655
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolderInt(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 4656
    .local v0, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setScrapContainer(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    .line 4657
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isChanged()Z

    move-result v1

    if-eqz v1, :cond_15

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z
    invoke-static {v1}, Landroid/support/v7/widget/RecyclerView;->access$2400(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v1

    if-nez v1, :cond_3b

    .line 4658
    :cond_15
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isInvalid()Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v1

    if-nez v1, :cond_35

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v1}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v1

    if-nez v1, :cond_35

    .line 4659
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 4663
    :cond_35
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4670
    :goto_3a
    return-void

    .line 4665
    :cond_3b
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    if-nez v1, :cond_46

    .line 4666
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    .line 4668
    :cond_46
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a
.end method

.method setAdapterPositionsAsUnknown()V
    .registers 5

    .prologue
    .line 4968
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4969
    .local v0, "cachedCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v0, :cond_1b

    .line 4970
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4971
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-eqz v1, :cond_18

    .line 4972
    const/16 v3, 0x200

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 4969
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 4975
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_1b
    return-void
.end method

.method setRecycledViewPool(Landroid/support/v7/widget/RecyclerView$RecycledViewPool;)V
    .registers 4
    .param p1, "pool"    # Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    .prologue
    .line 4932
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    if-eqz v0, :cond_9

    .line 4933
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->detach()V

    .line 4935
    :cond_9
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    .line 4936
    if-eqz p1, :cond_18

    .line 4937
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mRecyclerPool:Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->attach(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 4939
    :cond_18
    return-void
.end method

.method setViewCacheExtension(Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;)V
    .registers 2
    .param p1, "extension"    # Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;

    .prologue
    .line 4928
    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheExtension:Landroid/support/v7/widget/RecyclerView$ViewCacheExtension;

    .line 4929
    return-void
.end method

.method public setViewCacheSize(I)V
    .registers 4
    .param p1, "viewCount"    # I

    .prologue
    .line 4183
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mViewCacheMax:I

    .line 4185
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_a
    if-ltz v0, :cond_1a

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, p1, :cond_1a

    .line 4186
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    .line 4185
    add-int/lit8 v0, v0, -0x1

    goto :goto_a

    .line 4188
    :cond_1a
    return-void
.end method

.method unscrapView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 4679
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isChanged()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z
    invoke-static {v0}, Landroid/support/v7/widget/RecyclerView;->access$2400(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    if-nez v0, :cond_1f

    .line 4680
    :cond_12
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mAttachedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4684
    :goto_17
    const/4 v0, 0x0

    # setter for: Landroid/support/v7/widget/RecyclerView$ViewHolder;->mScrapContainer:Landroid/support/v7/widget/RecyclerView$Recycler;
    invoke-static {p1, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->access$4102(Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/support/v7/widget/RecyclerView$Recycler;

    .line 4685
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->clearReturnedFromScrapFlag()V

    .line 4686
    return-void

    .line 4682
    :cond_1f
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mChangedScrap:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_17
.end method

.method validateViewHolderForOffsetPosition(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .registers 10
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 4210
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->isRemoved()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 4227
    :cond_8
    :goto_8
    return v1

    .line 4213
    :cond_9
    iget v3, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    if-ltz v3, :cond_1b

    iget v3, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    iget-object v4, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    if-lt v3, v4, :cond_34

    .line 4214
    :cond_1b
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Inconsistency detected. Invalid view holder adapter position"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 4217
    :cond_34
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, v3, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v3

    if-nez v3, :cond_52

    .line 4219
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    iget v4, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result v0

    .line 4220
    .local v0, "type":I
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v3

    if-eq v0, v3, :cond_52

    move v1, v2

    .line 4221
    goto :goto_8

    .line 4224
    .end local v0    # "type":I
    :cond_52
    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 4225
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getItemId()J

    move-result-wide v4

    iget-object v3, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v3}, Landroid/support/v7/widget/RecyclerView;->access$2200(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v3

    iget v6, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mPosition:I

    invoke-virtual {v3, v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_8

    move v1, v2

    goto :goto_8
.end method

.method viewRangeUpdate(II)V
    .registers 9
    .param p1, "positionStart"    # I
    .param p2, "itemCount"    # I

    .prologue
    .line 4949
    add-int v4, p1, p2

    .line 4950
    .local v4, "positionEnd":I
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 4951
    .local v0, "cachedCount":I
    add-int/lit8 v2, v0, -0x1

    .local v2, "i":I
    :goto_a
    if-ltz v2, :cond_29

    .line 4952
    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$Recycler;->mCachedViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 4953
    .local v1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v1, :cond_19

    .line 4951
    :cond_16
    :goto_16
    add-int/lit8 v2, v2, -0x1

    goto :goto_a

    .line 4957
    :cond_19
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getLayoutPosition()I

    move-result v3

    .line 4958
    .local v3, "pos":I
    if-lt v3, p1, :cond_16

    if-ge v3, v4, :cond_16

    .line 4959
    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->addFlags(I)V

    .line 4960
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView$Recycler;->recycleCachedViewAt(I)V

    goto :goto_16

    .line 4965
    .end local v1    # "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .end local v3    # "pos":I
    :cond_29
    return-void
.end method
