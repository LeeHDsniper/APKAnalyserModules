.class final Landroid/support/v4/app/BackStackRecord;
.super Landroid/support/v4/app/FragmentTransaction;
.source "BackStackRecord.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/BackStackRecord$TransitionState;,
        Landroid/support/v4/app/BackStackRecord$Op;
    }
.end annotation


# static fields
.field static final SUPPORTS_TRANSITIONS:Z


# instance fields
.field mAddToBackStack:Z

.field mAllowAddToBackStack:Z

.field mBreadCrumbShortTitleRes:I

.field mBreadCrumbShortTitleText:Ljava/lang/CharSequence;

.field mBreadCrumbTitleRes:I

.field mBreadCrumbTitleText:Ljava/lang/CharSequence;

.field mCommitted:Z

.field mEnterAnim:I

.field mExitAnim:I

.field mHead:Landroid/support/v4/app/BackStackRecord$Op;

.field mIndex:I

.field final mManager:Landroid/support/v4/app/FragmentManagerImpl;

.field mName:Ljava/lang/String;

.field mNumOp:I

.field mPopEnterAnim:I

.field mPopExitAnim:I

.field mSharedElementSourceNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mSharedElementTargetNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mTail:Landroid/support/v4/app/BackStackRecord$Op;

.field mTransition:I

.field mTransitionStyle:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 194
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_7
    sput-boolean v0, Landroid/support/v4/app/BackStackRecord;->SUPPORTS_TRANSITIONS:Z

    return-void

    :cond_a
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public constructor <init>(Landroid/support/v4/app/FragmentManagerImpl;)V
    .registers 3
    .param p1, "manager"    # Landroid/support/v4/app/FragmentManagerImpl;

    .prologue
    .line 356
    invoke-direct {p0}, Landroid/support/v4/app/FragmentTransaction;-><init>()V

    .line 229
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/BackStackRecord;->mAllowAddToBackStack:Z

    .line 232
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    .line 357
    iput-object p1, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    .line 358
    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/support/v4/app/Fragment;)Landroid/support/v4/util/ArrayMap;
    .registers 5
    .param p0, "x0"    # Landroid/support/v4/app/BackStackRecord;
    .param p1, "x1"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "x2"    # Z
    .param p3, "x3"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 191
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/app/BackStackRecord;->mapSharedElementsIn(Landroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/support/v4/app/Fragment;)Landroid/support/v4/util/ArrayMap;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/BackStackRecord$TransitionState;)V
    .registers 3
    .param p0, "x0"    # Landroid/support/v4/app/BackStackRecord;
    .param p1, "x1"    # Landroid/support/v4/util/ArrayMap;
    .param p2, "x2"    # Landroid/support/v4/app/BackStackRecord$TransitionState;

    .prologue
    .line 191
    invoke-direct {p0, p1, p2}, Landroid/support/v4/app/BackStackRecord;->setEpicenterIn(Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/BackStackRecord$TransitionState;)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;)V
    .registers 6
    .param p0, "x0"    # Landroid/support/v4/app/BackStackRecord;
    .param p1, "x1"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "x2"    # Landroid/support/v4/app/Fragment;
    .param p3, "x3"    # Landroid/support/v4/app/Fragment;
    .param p4, "x4"    # Z
    .param p5, "x5"    # Landroid/support/v4/util/ArrayMap;

    .prologue
    .line 191
    invoke-direct/range {p0 .. p5}, Landroid/support/v4/app/BackStackRecord;->callSharedElementEnd(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;)V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V
    .registers 4
    .param p0, "x0"    # Landroid/support/v4/app/BackStackRecord;
    .param p1, "x1"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/Object;

    .prologue
    .line 191
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/app/BackStackRecord;->excludeHiddenFragments(Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V

    return-void
.end method

.method private beginTransition(Landroid/util/SparseArray;Landroid/util/SparseArray;Z)Landroid/support/v4/app/BackStackRecord$TransitionState;
    .registers 12
    .param p3, "isBack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;Z)",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;"
        }
    .end annotation

    .prologue
    .line 1021
    .local p1, "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    .local p2, "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    new-instance v2, Landroid/support/v4/app/BackStackRecord$TransitionState;

    invoke-direct {v2, p0}, Landroid/support/v4/app/BackStackRecord$TransitionState;-><init>(Landroid/support/v4/app/BackStackRecord;)V

    .line 1026
    .local v2, "state":Landroid/support/v4/app/BackStackRecord$TransitionState;
    new-instance v0, Landroid/view/View;

    iget-object v3, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v3, v3, Landroid/support/v4/app/FragmentManagerImpl;->mActivity:Landroid/support/v4/app/FragmentActivity;

    invoke-direct {v0, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v0, v2, Landroid/support/v4/app/BackStackRecord$TransitionState;->nonExistentView:Landroid/view/View;

    .line 1028
    const/4 v6, 0x0

    .line 1030
    .local v6, "anyTransitionStarted":Z
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_12
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v7, v0, :cond_2a

    .line 1031
    invoke-virtual {p1, v7}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .local v1, "containerId":I
    move-object v0, p0

    move v3, p3

    move-object v4, p1

    move-object v5, p2

    .line 1032
    invoke-direct/range {v0 .. v5}, Landroid/support/v4/app/BackStackRecord;->configureTransitions(ILandroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/util/SparseArray;Landroid/util/SparseArray;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 1034
    const/4 v6, 0x1

    .line 1030
    :cond_27
    add-int/lit8 v7, v7, 0x1

    goto :goto_12

    .line 1039
    .end local v1    # "containerId":I
    :cond_2a
    const/4 v7, 0x0

    :goto_2b
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v7, v0, :cond_49

    .line 1040
    invoke-virtual {p2, v7}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 1041
    .restart local v1    # "containerId":I
    invoke-virtual {p1, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_46

    move-object v0, p0

    move v3, p3

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/app/BackStackRecord;->configureTransitions(ILandroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/util/SparseArray;Landroid/util/SparseArray;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 1044
    const/4 v6, 0x1

    .line 1039
    :cond_46
    add-int/lit8 v7, v7, 0x1

    goto :goto_2b

    .line 1048
    .end local v1    # "containerId":I
    :cond_49
    if-nez v6, :cond_4c

    .line 1049
    const/4 v2, 0x0

    .line 1052
    :cond_4c
    return-object v2
.end method

.method private calculateFragments(Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 777
    .local p1, "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    .local p2, "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    iget-object v4, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    invoke-interface {v4}, Landroid/support/v4/app/FragmentContainer;->hasView()Z

    move-result v4

    if-nez v4, :cond_b

    .line 822
    :cond_a
    return-void

    .line 780
    :cond_b
    iget-object v3, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    .line 781
    .local v3, "op":Landroid/support/v4/app/BackStackRecord$Op;
    :goto_d
    if-eqz v3, :cond_a

    .line 782
    iget v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    packed-switch v4, :pswitch_data_6e

    .line 820
    :goto_14
    iget-object v3, v3, Landroid/support/v4/app/BackStackRecord$Op;->next:Landroid/support/v4/app/BackStackRecord$Op;

    goto :goto_d

    .line 784
    :pswitch_17
    iget-object v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v4}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 787
    :pswitch_1d
    iget-object v0, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 788
    .local v0, "f":Landroid/support/v4/app/Fragment;
    iget-object v4, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    if-eqz v4, :cond_4c

    .line 789
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_26
    iget-object v4, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_4c

    .line 790
    iget-object v4, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    .line 791
    .local v2, "old":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_42

    iget v4, v2, Landroid/support/v4/app/Fragment;->mContainerId:I

    iget v5, v0, Landroid/support/v4/app/Fragment;->mContainerId:I

    if-ne v4, v5, :cond_45

    .line 792
    :cond_42
    if-ne v2, v0, :cond_48

    .line 793
    const/4 v0, 0x0

    .line 789
    :cond_45
    :goto_45
    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    .line 795
    :cond_48
    invoke-static {p1, v2}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_45

    .line 800
    .end local v1    # "i":I
    .end local v2    # "old":Landroid/support/v4/app/Fragment;
    :cond_4c
    invoke-direct {p0, p2, v0}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 804
    .end local v0    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_50
    iget-object v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v4}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 807
    :pswitch_56
    iget-object v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v4}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 810
    :pswitch_5c
    iget-object v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v4}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 813
    :pswitch_62
    iget-object v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v4}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 816
    :pswitch_68
    iget-object v4, v3, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v4}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 782
    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_17
        :pswitch_1d
        :pswitch_50
        :pswitch_56
        :pswitch_5c
        :pswitch_62
        :pswitch_68
    .end packed-switch
.end method

.method private callSharedElementEnd(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;)V
    .registers 10
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "inFragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "outFragment"    # Landroid/support/v4/app/Fragment;
    .param p4, "isBack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/support/v4/app/Fragment;",
            "Landroid/support/v4/app/Fragment;",
            "Z",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1264
    .local p5, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    if-eqz p4, :cond_1d

    iget-object v1, p3, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    .line 1267
    .local v1, "sharedElementCallback":Landroid/support/v4/app/SharedElementCallback;
    :goto_4
    if-eqz v1, :cond_1c

    .line 1268
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p5}, Landroid/support/v4/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1269
    .local v0, "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p5}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1270
    .local v2, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/support/v4/app/SharedElementCallback;->onSharedElementEnd(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 1272
    .end local v0    # "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :cond_1c
    return-void

    .line 1264
    .end local v1    # "sharedElementCallback":Landroid/support/v4/app/SharedElementCallback;
    :cond_1d
    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    goto :goto_4
.end method

.method private static captureExitingViews(Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;Landroid/view/View;)Ljava/lang/Object;
    .registers 6
    .param p0, "exitTransition"    # Ljava/lang/Object;
    .param p1, "outFragment"    # Landroid/support/v4/app/Fragment;
    .param p4, "nonExistentView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/support/v4/app/Fragment;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 1083
    .local p2, "exitingViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .local p3, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    if-eqz p0, :cond_a

    .line 1084
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {p0, v0, p2, p3, p4}, Landroid/support/v4/app/FragmentTransitionCompat21;->captureExitingViews(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;Ljava/util/Map;Landroid/view/View;)Ljava/lang/Object;

    move-result-object p0

    .line 1087
    :cond_a
    return-object p0
.end method

.method private configureTransitions(ILandroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/util/SparseArray;Landroid/util/SparseArray;)Z
    .registers 44
    .param p1, "containerId"    # I
    .param p2, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p3, "isBack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Z",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 1134
    .local p4, "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    .local p5, "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    move/from16 v0, p1

    invoke-interface {v4, v0}, Landroid/support/v4/app/FragmentContainer;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 1135
    .local v6, "sceneRoot":Landroid/view/ViewGroup;
    if-nez v6, :cond_12

    .line 1136
    const/4 v4, 0x0

    .line 1226
    :goto_11
    return v4

    .line 1138
    :cond_12
    move-object/from16 v0, p5

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/support/v4/app/Fragment;

    .line 1139
    .local v8, "inFragment":Landroid/support/v4/app/Fragment;
    move-object/from16 v0, p4

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/support/v4/app/Fragment;

    .line 1141
    .local v9, "outFragment":Landroid/support/v4/app/Fragment;
    move/from16 v0, p3

    invoke-static {v8, v0}, Landroid/support/v4/app/BackStackRecord;->getEnterTransition(Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v12

    .line 1142
    .local v12, "enterTransition":Ljava/lang/Object;
    move/from16 v0, p3

    invoke-static {v8, v9, v0}, Landroid/support/v4/app/BackStackRecord;->getSharedElementTransition(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v7

    .line 1144
    .local v7, "sharedElementTransition":Ljava/lang/Object;
    move/from16 v0, p3

    invoke-static {v9, v0}, Landroid/support/v4/app/BackStackRecord;->getExitTransition(Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v25

    .line 1145
    .local v25, "exitTransition":Ljava/lang/Object;
    if-nez v12, :cond_40

    if-nez v7, :cond_40

    if-nez v25, :cond_40

    .line 1147
    const/4 v4, 0x0

    goto :goto_11

    .line 1149
    :cond_40
    const/16 v35, 0x0

    .line 1150
    .local v35, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1151
    .local v11, "sharedElementTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    if-eqz v7, :cond_89

    .line 1152
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-direct {v0, v1, v9, v2}, Landroid/support/v4/app/BackStackRecord;->remapSharedElements(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Z)Landroid/support/v4/util/ArrayMap;

    move-result-object v35

    .line 1153
    move-object/from16 v0, p2

    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nonExistentView:Landroid/view/View;

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1154
    invoke-virtual/range {v35 .. v35}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1157
    if-eqz p3, :cond_151

    iget-object v0, v9, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    move-object/from16 v33, v0

    .line 1160
    .local v33, "callback":Landroid/support/v4/app/SharedElementCallback;
    :goto_67
    if-eqz v33, :cond_89

    .line 1161
    new-instance v36, Ljava/util/ArrayList;

    invoke-virtual/range {v35 .. v35}, Landroid/support/v4/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v4

    move-object/from16 v0, v36

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1162
    .local v36, "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v37, Ljava/util/ArrayList;

    invoke-virtual/range {v35 .. v35}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v4

    move-object/from16 v0, v37

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1163
    .local v37, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v4, 0x0

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2, v4}, Landroid/support/v4/app/SharedElementCallback;->onSharedElementStart(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 1167
    .end local v33    # "callback":Landroid/support/v4/app/SharedElementCallback;
    .end local v36    # "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v37    # "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :cond_89
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 1168
    .local v26, "exitingViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    move-object/from16 v0, p2

    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nonExistentView:Landroid/view/View;

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v35

    invoke-static {v0, v9, v1, v2, v4}, Landroid/support/v4/app/BackStackRecord;->captureExitingViews(Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v25

    .line 1172
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    if-eqz v4, :cond_c7

    if-eqz v35, :cond_c7

    .line 1173
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v0, v35

    invoke-virtual {v0, v4}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Landroid/view/View;

    .line 1174
    .local v34, "epicenterView":Landroid/view/View;
    if-eqz v34, :cond_c7

    .line 1175
    if-eqz v25, :cond_c0

    .line 1176
    move-object/from16 v0, v25

    move-object/from16 v1, v34

    invoke-static {v0, v1}, Landroid/support/v4/app/FragmentTransitionCompat21;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    .line 1178
    :cond_c0
    if-eqz v7, :cond_c7

    .line 1179
    move-object/from16 v0, v34

    invoke-static {v7, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    .line 1185
    .end local v34    # "epicenterView":Landroid/view/View;
    :cond_c7
    new-instance v15, Landroid/support/v4/app/BackStackRecord$1;

    move-object/from16 v0, p0

    invoke-direct {v15, v0, v8}, Landroid/support/v4/app/BackStackRecord$1;-><init>(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/Fragment;)V

    .line 1193
    .local v15, "viewRetriever":Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;
    if-eqz v7, :cond_d9

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    move/from16 v10, p3

    .line 1194
    invoke-direct/range {v4 .. v11}, Landroid/support/v4/app/BackStackRecord;->prepareSharedElementTransition(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/view/View;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLjava/util/ArrayList;)V

    .line 1198
    :cond_d9
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 1199
    .local v19, "enteringViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    new-instance v20, Landroid/support/v4/util/ArrayMap;

    invoke-direct/range {v20 .. v20}, Landroid/support/v4/util/ArrayMap;-><init>()V

    .line 1201
    .local v20, "renamedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    if-eqz p3, :cond_157

    invoke-virtual {v8}, Landroid/support/v4/app/Fragment;->getAllowReturnTransitionOverlap()Z

    move-result v32

    .line 1203
    .local v32, "allowOverlap":Z
    :goto_e9
    move-object/from16 v0, v25

    move/from16 v1, v32

    invoke-static {v12, v0, v7, v1}, Landroid/support/v4/app/FragmentTransitionCompat21;->mergeTransitions(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v29

    .line 1206
    .local v29, "transition":Ljava/lang/Object;
    if-eqz v29, :cond_14c

    .line 1207
    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nonExistentView:Landroid/view/View;

    move-object/from16 v16, v0

    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->enteringEpicenterView:Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;

    move-object/from16 v17, v0

    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nameOverrides:Landroid/support/v4/util/ArrayMap;

    move-object/from16 v18, v0

    move-object v13, v7

    move-object v14, v6

    move-object/from16 v21, v11

    invoke-static/range {v12 .. v21}, Landroid/support/v4/app/FragmentTransitionCompat21;->addTransitionTargets(Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/ArrayList;)V

    .line 1211
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p1

    move-object/from16 v3, v29

    invoke-direct {v0, v6, v1, v2, v3}, Landroid/support/v4/app/BackStackRecord;->excludeHiddenFragmentsAfterEnter(Landroid/view/View;Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V

    .line 1215
    move-object/from16 v0, p2

    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nonExistentView:Landroid/view/View;

    const/4 v5, 0x1

    move-object/from16 v0, v29

    invoke-static {v0, v4, v5}, Landroid/support/v4/app/FragmentTransitionCompat21;->excludeTarget(Ljava/lang/Object;Landroid/view/View;Z)V

    .line 1217
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p1

    move-object/from16 v3, v29

    invoke-direct {v0, v1, v2, v3}, Landroid/support/v4/app/BackStackRecord;->excludeHiddenFragments(Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V

    .line 1219
    move-object/from16 v0, v29

    invoke-static {v6, v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->beginDelayedTransition(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 1221
    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nonExistentView:Landroid/view/View;

    move-object/from16 v22, v0

    move-object/from16 v0, p2

    iget-object v0, v0, Landroid/support/v4/app/BackStackRecord$TransitionState;->hiddenFragmentViews:Ljava/util/ArrayList;

    move-object/from16 v30, v0

    move-object/from16 v21, v6

    move-object/from16 v23, v12

    move-object/from16 v24, v19

    move-object/from16 v27, v7

    move-object/from16 v28, v11

    move-object/from16 v31, v20

    invoke-static/range {v21 .. v31}, Landroid/support/v4/app/FragmentTransitionCompat21;->cleanupTransitions(Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 1226
    :cond_14c
    if-eqz v29, :cond_15c

    const/4 v4, 0x1

    goto/16 :goto_11

    .line 1157
    .end local v15    # "viewRetriever":Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;
    .end local v19    # "enteringViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v20    # "renamedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    .end local v26    # "exitingViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v29    # "transition":Ljava/lang/Object;
    .end local v32    # "allowOverlap":Z
    :cond_151
    iget-object v0, v8, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    move-object/from16 v33, v0

    goto/16 :goto_67

    .line 1201
    .restart local v15    # "viewRetriever":Landroid/support/v4/app/FragmentTransitionCompat21$ViewRetriever;
    .restart local v19    # "enteringViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v20    # "renamedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    .restart local v26    # "exitingViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    :cond_157
    invoke-virtual {v8}, Landroid/support/v4/app/Fragment;->getAllowEnterTransitionOverlap()Z

    move-result v32

    goto :goto_e9

    .line 1226
    .restart local v29    # "transition":Ljava/lang/Object;
    .restart local v32    # "allowOverlap":Z
    :cond_15c
    const/4 v4, 0x0

    goto/16 :goto_11
.end method

.method private doAddOp(ILandroid/support/v4/app/Fragment;Ljava/lang/String;I)V
    .registers 9
    .param p1, "containerViewId"    # I
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "tag"    # Ljava/lang/String;
    .param p4, "opcmd"    # I

    .prologue
    .line 417
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iput-object v1, p2, Landroid/support/v4/app/Fragment;->mFragmentManager:Landroid/support/v4/app/FragmentManagerImpl;

    .line 419
    if-eqz p3, :cond_43

    .line 420
    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    if-eqz v1, :cond_41

    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_41

    .line 421
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can\'t change tag of fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " now "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 425
    :cond_41
    iput-object p3, p2, Landroid/support/v4/app/Fragment;->mTag:Ljava/lang/String;

    .line 428
    :cond_43
    if-eqz p1, :cond_80

    .line 429
    iget v1, p2, Landroid/support/v4/app/Fragment;->mFragmentId:I

    if-eqz v1, :cond_7c

    iget v1, p2, Landroid/support/v4/app/Fragment;->mFragmentId:I

    if-eq v1, p1, :cond_7c

    .line 430
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Can\'t change container ID of fragment "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p2, Landroid/support/v4/app/Fragment;->mFragmentId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " now "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 434
    :cond_7c
    iput p1, p2, Landroid/support/v4/app/Fragment;->mFragmentId:I

    iput p1, p2, Landroid/support/v4/app/Fragment;->mContainerId:I

    .line 437
    :cond_80
    new-instance v0, Landroid/support/v4/app/BackStackRecord$Op;

    invoke-direct {v0}, Landroid/support/v4/app/BackStackRecord$Op;-><init>()V

    .line 438
    .local v0, "op":Landroid/support/v4/app/BackStackRecord$Op;
    iput p4, v0, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    .line 439
    iput-object p2, v0, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 440
    invoke-virtual {p0, v0}, Landroid/support/v4/app/BackStackRecord;->addOp(Landroid/support/v4/app/BackStackRecord$Op;)V

    .line 441
    return-void
.end method

.method private excludeHiddenFragments(Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V
    .registers 8
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "containerId"    # I
    .param p3, "transition"    # Ljava/lang/Object;

    .prologue
    .line 1372
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v2, v2, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    if-eqz v2, :cond_53

    .line 1373
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v2, v2, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_53

    .line 1374
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v2, v2, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 1375
    .local v0, "fragment":Landroid/support/v4/app/Fragment;
    iget-object v2, v0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v2, :cond_42

    iget-object v2, v0, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    if-eqz v2, :cond_42

    iget v2, v0, Landroid/support/v4/app/Fragment;->mContainerId:I

    if-ne v2, p2, :cond_42

    .line 1377
    iget-boolean v2, v0, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v2, :cond_45

    .line 1378
    iget-object v2, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->hiddenFragmentViews:Ljava/util/ArrayList;

    iget-object v3, v0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_42

    .line 1379
    iget-object v2, v0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    const/4 v3, 0x1

    invoke-static {p3, v2, v3}, Landroid/support/v4/app/FragmentTransitionCompat21;->excludeTarget(Ljava/lang/Object;Landroid/view/View;Z)V

    .line 1381
    iget-object v2, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->hiddenFragmentViews:Ljava/util/ArrayList;

    iget-object v3, v0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1373
    :cond_42
    :goto_42
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 1384
    :cond_45
    iget-object v2, v0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-static {p3, v2, v3}, Landroid/support/v4/app/FragmentTransitionCompat21;->excludeTarget(Ljava/lang/Object;Landroid/view/View;Z)V

    .line 1386
    iget-object v2, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->hiddenFragmentViews:Ljava/util/ArrayList;

    iget-object v3, v0, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_42

    .line 1391
    .end local v0    # "fragment":Landroid/support/v4/app/Fragment;
    .end local v1    # "i":I
    :cond_53
    return-void
.end method

.method private excludeHiddenFragmentsAfterEnter(Landroid/view/View;Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V
    .registers 12
    .param p1, "sceneRoot"    # Landroid/view/View;
    .param p2, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p3, "containerId"    # I
    .param p4, "transition"    # Ljava/lang/Object;

    .prologue
    .line 1361
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v6

    new-instance v0, Landroid/support/v4/app/BackStackRecord$3;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/app/BackStackRecord$3;-><init>(Landroid/support/v4/app/BackStackRecord;Landroid/view/View;Landroid/support/v4/app/BackStackRecord$TransitionState;ILjava/lang/Object;)V

    invoke-virtual {v6, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1369
    return-void
.end method

.method private static getEnterTransition(Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 3
    .param p0, "inFragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "isBack"    # Z

    .prologue
    .line 1056
    if-nez p0, :cond_4

    .line 1057
    const/4 v0, 0x0

    .line 1059
    :goto_3
    return-object v0

    :cond_4
    if-eqz p1, :cond_f

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getReenterTransition()Ljava/lang/Object;

    move-result-object v0

    :goto_a
    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    :cond_f
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getEnterTransition()Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method

.method private static getExitTransition(Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 3
    .param p0, "outFragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "isBack"    # Z

    .prologue
    .line 1064
    if-nez p0, :cond_4

    .line 1065
    const/4 v0, 0x0

    .line 1067
    :goto_3
    return-object v0

    :cond_4
    if-eqz p1, :cond_f

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getReturnTransition()Ljava/lang/Object;

    move-result-object v0

    :goto_a
    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    :cond_f
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getExitTransition()Ljava/lang/Object;

    move-result-object v0

    goto :goto_a
.end method

.method private static getSharedElementTransition(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 4
    .param p0, "inFragment"    # Landroid/support/v4/app/Fragment;
    .param p1, "outFragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "isBack"    # Z

    .prologue
    .line 1073
    if-eqz p0, :cond_4

    if-nez p1, :cond_6

    .line 1074
    :cond_4
    const/4 v0, 0x0

    .line 1076
    :goto_5
    return-object v0

    :cond_6
    if-eqz p2, :cond_11

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getSharedElementReturnTransition()Ljava/lang/Object;

    move-result-object v0

    :goto_c
    invoke-static {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5

    :cond_11
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getSharedElementEnterTransition()Ljava/lang/Object;

    move-result-object v0

    goto :goto_c
.end method

.method private mapEnteringSharedElements(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Z)Landroid/support/v4/util/ArrayMap;
    .registers 8
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "inFragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "isBack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/support/v4/app/Fragment;",
            "Z)",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1343
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    .line 1344
    .local v0, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    .line 1345
    .local v1, "root":Landroid/view/View;
    if-eqz v1, :cond_1c

    .line 1346
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-eqz v2, :cond_1c

    .line 1347
    invoke-static {v0, v1}, Landroid/support/v4/app/FragmentTransitionCompat21;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 1348
    if-eqz p3, :cond_1d

    .line 1349
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-static {v2, v3, v0}, Landroid/support/v4/app/BackStackRecord;->remapNames(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;)Landroid/support/v4/util/ArrayMap;

    move-result-object v0

    .line 1356
    :cond_1c
    :goto_1c
    return-object v0

    .line 1352
    :cond_1d
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Landroid/support/v4/util/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    goto :goto_1c
.end method

.method private mapSharedElementsIn(Landroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/support/v4/app/Fragment;)Landroid/support/v4/util/ArrayMap;
    .registers 8
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "isBack"    # Z
    .param p3, "inFragment"    # Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Z",
            "Landroid/support/v4/app/Fragment;",
            ")",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 1288
    invoke-direct {p0, p1, p3, p2}, Landroid/support/v4/app/BackStackRecord;->mapEnteringSharedElements(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Z)Landroid/support/v4/util/ArrayMap;

    move-result-object v0

    .line 1292
    .local v0, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    if-eqz p2, :cond_16

    .line 1293
    iget-object v1, p3, Landroid/support/v4/app/Fragment;->mExitTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    if-eqz v1, :cond_12

    .line 1294
    iget-object v1, p3, Landroid/support/v4/app/Fragment;->mExitTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    .line 1297
    :cond_12
    invoke-direct {p0, p1, v0, v3}, Landroid/support/v4/app/BackStackRecord;->setBackNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/util/ArrayMap;Z)V

    .line 1305
    :goto_15
    return-object v0

    .line 1299
    :cond_16
    iget-object v1, p3, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    if-eqz v1, :cond_21

    .line 1300
    iget-object v1, p3, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    .line 1303
    :cond_21
    invoke-direct {p0, p1, v0, v3}, Landroid/support/v4/app/BackStackRecord;->setNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/util/ArrayMap;Z)V

    goto :goto_15
.end method

.method private prepareSharedElementTransition(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/view/View;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLjava/util/ArrayList;)V
    .registers 18
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "sceneRoot"    # Landroid/view/View;
    .param p3, "sharedElementTransition"    # Ljava/lang/Object;
    .param p4, "inFragment"    # Landroid/support/v4/app/Fragment;
    .param p5, "outFragment"    # Landroid/support/v4/app/Fragment;
    .param p6, "isBack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/view/View;",
            "Ljava/lang/Object;",
            "Landroid/support/v4/app/Fragment;",
            "Landroid/support/v4/app/Fragment;",
            "Z",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1233
    .local p7, "sharedElementTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v9

    new-instance v0, Landroid/support/v4/app/BackStackRecord$2;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p7

    move-object v5, p1

    move/from16 v6, p6

    move-object v7, p4

    move-object v8, p5

    invoke-direct/range {v0 .. v8}, Landroid/support/v4/app/BackStackRecord$2;-><init>(Landroid/support/v4/app/BackStackRecord;Landroid/view/View;Ljava/lang/Object;Ljava/util/ArrayList;Landroid/support/v4/app/BackStackRecord$TransitionState;ZLandroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;)V

    invoke-virtual {v9, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 1260
    return-void
.end method

.method private static remapNames(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;)Landroid/support/v4/util/ArrayMap;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1318
    .local p0, "inMap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p1, "toGoInMap":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual {p2}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1329
    .end local p2    # "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    :goto_6
    return-object p2

    .line 1321
    .restart local p2    # "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    :cond_7
    new-instance v2, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v2}, Landroid/support/v4/util/ArrayMap;-><init>()V

    .line 1322
    .local v2, "remappedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1323
    .local v1, "numKeys":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v1, :cond_29

    .line 1324
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 1325
    .local v3, "view":Landroid/view/View;
    if-eqz v3, :cond_26

    .line 1326
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4, v3}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1323
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .end local v3    # "view":Landroid/view/View;
    :cond_29
    move-object p2, v2

    .line 1329
    goto :goto_6
.end method

.method private remapSharedElements(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/app/Fragment;Z)Landroid/support/v4/util/ArrayMap;
    .registers 8
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p2, "outFragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "isBack"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/support/v4/app/Fragment;",
            "Z)",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 1092
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    .line 1093
    .local v0, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-eqz v1, :cond_18

    .line 1094
    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/support/v4/app/FragmentTransitionCompat21;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    .line 1095
    if-eqz p3, :cond_29

    .line 1096
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Landroid/support/v4/util/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    .line 1103
    :cond_18
    :goto_18
    if-eqz p3, :cond_32

    .line 1104
    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    if-eqz v1, :cond_25

    .line 1105
    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mEnterTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    .line 1108
    :cond_25
    invoke-direct {p0, p1, v0, v3}, Landroid/support/v4/app/BackStackRecord;->setBackNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/util/ArrayMap;Z)V

    .line 1117
    :goto_28
    return-object v0

    .line 1098
    :cond_29
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-static {v1, v2, v0}, Landroid/support/v4/app/BackStackRecord;->remapNames(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;)Landroid/support/v4/util/ArrayMap;

    move-result-object v0

    goto :goto_18

    .line 1110
    :cond_32
    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mExitTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    if-eqz v1, :cond_3d

    .line 1111
    iget-object v1, p2, Landroid/support/v4/app/Fragment;->mExitTransitionCallback:Landroid/support/v4/app/SharedElementCallback;

    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    .line 1114
    :cond_3d
    invoke-direct {p0, p1, v0, v3}, Landroid/support/v4/app/BackStackRecord;->setNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/util/ArrayMap;Z)V

    goto :goto_28
.end method

.method private setBackNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/util/ArrayMap;Z)V
    .registers 11
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p3, "isEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 1419
    .local p2, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    iget-object v6, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    if-nez v6, :cond_2e

    const/4 v0, 0x0

    .line 1420
    .local v0, "count":I
    :goto_5
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    if-ge v1, v0, :cond_3b

    .line 1421
    iget-object v6, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1422
    .local v3, "source":Ljava/lang/String;
    iget-object v6, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1423
    .local v2, "originalTarget":Ljava/lang/String;
    invoke-virtual {p2, v2}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    .line 1424
    .local v5, "view":Landroid/view/View;
    if-eqz v5, :cond_2b

    .line 1425
    invoke-static {v5}, Landroid/support/v4/app/FragmentTransitionCompat21;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v4

    .line 1426
    .local v4, "target":Ljava/lang/String;
    if-eqz p3, :cond_35

    .line 1427
    iget-object v6, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->nameOverrides:Landroid/support/v4/util/ArrayMap;

    invoke-static {v6, v3, v4}, Landroid/support/v4/app/BackStackRecord;->setNameOverride(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 1420
    .end local v4    # "target":Ljava/lang/String;
    :cond_2b
    :goto_2b
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1419
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "originalTarget":Ljava/lang/String;
    .end local v3    # "source":Ljava/lang/String;
    .end local v5    # "view":Landroid/view/View;
    :cond_2e
    iget-object v6, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_5

    .line 1429
    .restart local v0    # "count":I
    .restart local v1    # "i":I
    .restart local v2    # "originalTarget":Ljava/lang/String;
    .restart local v3    # "source":Ljava/lang/String;
    .restart local v4    # "target":Ljava/lang/String;
    .restart local v5    # "view":Landroid/view/View;
    :cond_35
    iget-object v6, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->nameOverrides:Landroid/support/v4/util/ArrayMap;

    invoke-static {v6, v4, v3}, Landroid/support/v4/app/BackStackRecord;->setNameOverride(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2b

    .line 1433
    .end local v2    # "originalTarget":Ljava/lang/String;
    .end local v3    # "source":Ljava/lang/String;
    .end local v4    # "target":Ljava/lang/String;
    .end local v5    # "view":Landroid/view/View;
    :cond_3b
    return-void
.end method

.method private setEpicenterIn(Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/BackStackRecord$TransitionState;)V
    .registers 6
    .param p2, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1275
    .local p1, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    if-eqz v1, :cond_1d

    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1d

    .line 1277
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 1279
    .local v0, "epicenter":Landroid/view/View;
    if-eqz v0, :cond_1d

    .line 1280
    iget-object v1, p2, Landroid/support/v4/app/BackStackRecord$TransitionState;->enteringEpicenterView:Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;

    iput-object v0, v1, Landroid/support/v4/app/FragmentTransitionCompat21$EpicenterView;->epicenter:Landroid/view/View;

    .line 1283
    .end local v0    # "epicenter":Landroid/view/View;
    :cond_1d
    return-void
.end method

.method private static setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V
    .registers 4
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/support/v4/app/Fragment;",
            ")V"
        }
    .end annotation

    .prologue
    .line 748
    .local p0, "fragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    if-eqz p1, :cond_21

    .line 749
    iget v0, p1, Landroid/support/v4/app/Fragment;->mContainerId:I

    .line 750
    .local v0, "containerId":I
    if-eqz v0, :cond_21

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isHidden()Z

    move-result v1

    if-nez v1, :cond_21

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->isAdded()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_21

    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_21

    .line 752
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 755
    .end local v0    # "containerId":I
    :cond_21
    return-void
.end method

.method private setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V
    .registers 4
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/support/v4/app/Fragment;",
            ")V"
        }
    .end annotation

    .prologue
    .line 758
    .local p1, "fragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    if-eqz p2, :cond_9

    .line 759
    iget v0, p2, Landroid/support/v4/app/Fragment;->mContainerId:I

    .line 760
    .local v0, "containerId":I
    if-eqz v0, :cond_9

    .line 761
    invoke-virtual {p1, v0, p2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 764
    .end local v0    # "containerId":I
    :cond_9
    return-void
.end method

.method private static setNameOverride(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1395
    .local p0, "overrides":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_1e

    if-eqz p2, :cond_1e

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 1396
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_b
    invoke-virtual {p0}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v1

    if-ge v0, v1, :cond_22

    .line 1397
    invoke-virtual {p0, v0}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 1398
    invoke-virtual {p0, v0, p2}, Landroid/support/v4/util/ArrayMap;->setValueAt(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1404
    .end local v0    # "index":I
    :cond_1e
    :goto_1e
    return-void

    .line 1396
    .restart local v0    # "index":I
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 1402
    :cond_22
    invoke-virtual {p0, p1, p2}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1e
.end method

.method private setNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Landroid/support/v4/util/ArrayMap;Z)V
    .registers 9
    .param p1, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .param p3, "isEnd"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 1437
    .local p2, "namedViews":Landroid/support/v4/util/ArrayMap;, "Landroid/support/v4/util/ArrayMap<Ljava/lang/String;Landroid/view/View;>;"
    invoke-virtual {p2}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v0

    .line 1438
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    if-ge v1, v0, :cond_27

    .line 1439
    invoke-virtual {p2, v1}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1440
    .local v2, "source":Ljava/lang/String;
    invoke-virtual {p2, v1}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-static {v4}, Landroid/support/v4/app/FragmentTransitionCompat21;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v3

    .line 1441
    .local v3, "target":Ljava/lang/String;
    if-eqz p3, :cond_21

    .line 1442
    iget-object v4, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->nameOverrides:Landroid/support/v4/util/ArrayMap;

    invoke-static {v4, v2, v3}, Landroid/support/v4/app/BackStackRecord;->setNameOverride(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    :goto_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 1444
    :cond_21
    iget-object v4, p1, Landroid/support/v4/app/BackStackRecord$TransitionState;->nameOverrides:Landroid/support/v4/util/ArrayMap;

    invoke-static {v4, v3, v2}, Landroid/support/v4/app/BackStackRecord;->setNameOverride(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1e

    .line 1447
    .end local v2    # "source":Ljava/lang/String;
    .end local v3    # "target":Ljava/lang/String;
    :cond_27
    return-void
.end method

.method private static setNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 7
    .param p0, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1408
    .local p1, "sourceNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "targetNames":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_1d

    .line 1409
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1d

    .line 1410
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1411
    .local v1, "source":Ljava/lang/String;
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1412
    .local v2, "target":Ljava/lang/String;
    iget-object v3, p0, Landroid/support/v4/app/BackStackRecord$TransitionState;->nameOverrides:Landroid/support/v4/util/ArrayMap;

    invoke-static {v3, v1, v2}, Landroid/support/v4/app/BackStackRecord;->setNameOverride(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;Ljava/lang/String;)V

    .line 1409
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 1415
    .end local v0    # "i":I
    .end local v1    # "source":Ljava/lang/String;
    .end local v2    # "target":Ljava/lang/String;
    :cond_1d
    return-void
.end method


# virtual methods
.method public add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
    .registers 5
    .param p1, "containerViewId"    # I
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 407
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v4/app/BackStackRecord;->doAddOp(ILandroid/support/v4/app/Fragment;Ljava/lang/String;I)V

    .line 408
    return-object p0
.end method

.method public add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
    .registers 5
    .param p1, "containerViewId"    # I
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "tag"    # Ljava/lang/String;

    .prologue
    .line 412
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/app/BackStackRecord;->doAddOp(ILandroid/support/v4/app/Fragment;Ljava/lang/String;I)V

    .line 413
    return-object p0
.end method

.method public add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
    .registers 5
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 402
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, p2, v1}, Landroid/support/v4/app/BackStackRecord;->doAddOp(ILandroid/support/v4/app/Fragment;Ljava/lang/String;I)V

    .line 403
    return-object p0
.end method

.method addOp(Landroid/support/v4/app/BackStackRecord$Op;)V
    .registers 3
    .param p1, "op"    # Landroid/support/v4/app/BackStackRecord$Op;

    .prologue
    .line 387
    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    if-nez v0, :cond_1f

    .line 388
    iput-object p1, p0, Landroid/support/v4/app/BackStackRecord;->mTail:Landroid/support/v4/app/BackStackRecord$Op;

    iput-object p1, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    .line 394
    :goto_8
    iget v0, p0, Landroid/support/v4/app/BackStackRecord;->mEnterAnim:I

    iput v0, p1, Landroid/support/v4/app/BackStackRecord$Op;->enterAnim:I

    .line 395
    iget v0, p0, Landroid/support/v4/app/BackStackRecord;->mExitAnim:I

    iput v0, p1, Landroid/support/v4/app/BackStackRecord$Op;->exitAnim:I

    .line 396
    iget v0, p0, Landroid/support/v4/app/BackStackRecord;->mPopEnterAnim:I

    iput v0, p1, Landroid/support/v4/app/BackStackRecord$Op;->popEnterAnim:I

    .line 397
    iget v0, p0, Landroid/support/v4/app/BackStackRecord;->mPopExitAnim:I

    iput v0, p1, Landroid/support/v4/app/BackStackRecord$Op;->popExitAnim:I

    .line 398
    iget v0, p0, Landroid/support/v4/app/BackStackRecord;->mNumOp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v4/app/BackStackRecord;->mNumOp:I

    .line 399
    return-void

    .line 390
    :cond_1f
    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mTail:Landroid/support/v4/app/BackStackRecord$Op;

    iput-object v0, p1, Landroid/support/v4/app/BackStackRecord$Op;->prev:Landroid/support/v4/app/BackStackRecord$Op;

    .line 391
    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mTail:Landroid/support/v4/app/BackStackRecord$Op;

    iput-object p1, v0, Landroid/support/v4/app/BackStackRecord$Op;->next:Landroid/support/v4/app/BackStackRecord$Op;

    .line 392
    iput-object p1, p0, Landroid/support/v4/app/BackStackRecord;->mTail:Landroid/support/v4/app/BackStackRecord$Op;

    goto :goto_8
.end method

.method public addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 544
    iget-boolean v0, p0, Landroid/support/v4/app/BackStackRecord;->mAllowAddToBackStack:Z

    if-nez v0, :cond_c

    .line 545
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This FragmentTransaction is not allowed to be added to the back stack."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 548
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/BackStackRecord;->mAddToBackStack:Z

    .line 549
    iput-object p1, p0, Landroid/support/v4/app/BackStackRecord;->mName:Ljava/lang/String;

    .line 550
    return-object p0
.end method

.method public attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
    .registers 4
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 493
    new-instance v0, Landroid/support/v4/app/BackStackRecord$Op;

    invoke-direct {v0}, Landroid/support/v4/app/BackStackRecord$Op;-><init>()V

    .line 494
    .local v0, "op":Landroid/support/v4/app/BackStackRecord$Op;
    const/4 v1, 0x7

    iput v1, v0, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    .line 495
    iput-object p1, v0, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 496
    invoke-virtual {p0, v0}, Landroid/support/v4/app/BackStackRecord;->addOp(Landroid/support/v4/app/BackStackRecord$Op;)V

    .line 498
    return-object p0
.end method

.method bumpBackStackNesting(I)V
    .registers 8
    .param p1, "amt"    # I

    .prologue
    .line 591
    iget-boolean v3, p0, Landroid/support/v4/app/BackStackRecord;->mAddToBackStack:Z

    if-nez v3, :cond_5

    .line 613
    :cond_4
    return-void

    .line 594
    :cond_5
    sget-boolean v3, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v3, :cond_2b

    const-string v3, "FragmentManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bump nesting in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " by "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    :cond_2b
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    .line 597
    .local v1, "op":Landroid/support/v4/app/BackStackRecord$Op;
    :goto_2d
    if-eqz v1, :cond_4

    .line 598
    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    if-eqz v3, :cond_66

    .line 599
    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    iget v4, v3, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    add-int/2addr v4, p1

    iput v4, v3, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    .line 600
    sget-boolean v3, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v3, :cond_66

    const-string v3, "FragmentManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bump nesting of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    iget v5, v5, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    :cond_66
    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    if-eqz v3, :cond_ac

    .line 604
    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_72
    if-ltz v0, :cond_ac

    .line 605
    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    .line 606
    .local v2, "r":Landroid/support/v4/app/Fragment;
    iget v3, v2, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    add-int/2addr v3, p1

    iput v3, v2, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    .line 607
    sget-boolean v3, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v3, :cond_a9

    const-string v3, "FragmentManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bump nesting of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    :cond_a9
    add-int/lit8 v0, v0, -0x1

    goto :goto_72

    .line 611
    .end local v0    # "i":I
    .end local v2    # "r":Landroid/support/v4/app/Fragment;
    :cond_ac
    iget-object v1, v1, Landroid/support/v4/app/BackStackRecord$Op;->next:Landroid/support/v4/app/BackStackRecord$Op;

    goto/16 :goto_2d
.end method

.method public calculateBackFragments(Landroid/util/SparseArray;Landroid/util/SparseArray;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 835
    .local p1, "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    .local p2, "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v2, v2, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    invoke-interface {v2}, Landroid/support/v4/app/FragmentContainer;->hasView()Z

    move-result v2

    if-nez v2, :cond_b

    .line 871
    :cond_a
    return-void

    .line 838
    :cond_b
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    .line 839
    .local v1, "op":Landroid/support/v4/app/BackStackRecord$Op;
    :goto_d
    if-eqz v1, :cond_a

    .line 840
    iget v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    packed-switch v2, :pswitch_data_5e

    .line 869
    :goto_14
    iget-object v1, v1, Landroid/support/v4/app/BackStackRecord$Op;->next:Landroid/support/v4/app/BackStackRecord$Op;

    goto :goto_d

    .line 842
    :pswitch_17
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v2}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 845
    :pswitch_1d
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    if-eqz v2, :cond_39

    .line 846
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_29
    if-ltz v0, :cond_39

    .line 847
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v2}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    .line 846
    add-int/lit8 v0, v0, -0x1

    goto :goto_29

    .line 850
    .end local v0    # "i":I
    :cond_39
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v2}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 853
    :pswitch_3f
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v2}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 856
    :pswitch_45
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v2}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 859
    :pswitch_4b
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v2}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 862
    :pswitch_51
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-direct {p0, p2, v2}, Landroid/support/v4/app/BackStackRecord;->setLastIn(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 865
    :pswitch_57
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-static {p1, v2}, Landroid/support/v4/app/BackStackRecord;->setFirstOut(Landroid/util/SparseArray;Landroid/support/v4/app/Fragment;)V

    goto :goto_14

    .line 840
    nop

    :pswitch_data_5e
    .packed-switch 0x1
        :pswitch_17
        :pswitch_1d
        :pswitch_3f
        :pswitch_45
        :pswitch_4b
        :pswitch_51
        :pswitch_57
    .end packed-switch
.end method

.method public commit()I
    .registers 2

    .prologue
    .line 616
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/app/BackStackRecord;->commitInternal(Z)I

    move-result v0

    return v0
.end method

.method public commitAllowingStateLoss()I
    .registers 2

    .prologue
    .line 620
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/app/BackStackRecord;->commitInternal(Z)I

    move-result v0

    return v0
.end method

.method commitInternal(Z)I
    .registers 8
    .param p1, "allowStateLoss"    # Z

    .prologue
    const/4 v5, 0x0

    .line 624
    iget-boolean v2, p0, Landroid/support/v4/app/BackStackRecord;->mCommitted:Z

    if-eqz v2, :cond_d

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "commit already called"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 625
    :cond_d
    sget-boolean v2, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v2, :cond_3a

    .line 626
    const-string v2, "FragmentManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Commit: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 627
    new-instance v0, Landroid/support/v4/util/LogWriter;

    const-string v2, "FragmentManager"

    invoke-direct {v0, v2}, Landroid/support/v4/util/LogWriter;-><init>(Ljava/lang/String;)V

    .line 628
    .local v0, "logw":Landroid/support/v4/util/LogWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 629
    .local v1, "pw":Ljava/io/PrintWriter;
    const-string v2, "  "

    invoke-virtual {p0, v2, v5, v1, v5}, Landroid/support/v4/app/BackStackRecord;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 631
    .end local v0    # "logw":Landroid/support/v4/util/LogWriter;
    .end local v1    # "pw":Ljava/io/PrintWriter;
    :cond_3a
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/app/BackStackRecord;->mCommitted:Z

    .line 632
    iget-boolean v2, p0, Landroid/support/v4/app/BackStackRecord;->mAddToBackStack:Z

    if-eqz v2, :cond_51

    .line 633
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v2, p0}, Landroid/support/v4/app/FragmentManagerImpl;->allocBackStackIndex(Landroid/support/v4/app/BackStackRecord;)I

    move-result v2

    iput v2, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    .line 637
    :goto_49
    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v2, p0, p1}, Landroid/support/v4/app/FragmentManagerImpl;->enqueueAction(Ljava/lang/Runnable;Z)V

    .line 638
    iget v2, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    return v2

    .line 635
    :cond_51
    const/4 v2, -0x1

    iput v2, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    goto :goto_49
.end method

.method public detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
    .registers 4
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 484
    new-instance v0, Landroid/support/v4/app/BackStackRecord$Op;

    invoke-direct {v0}, Landroid/support/v4/app/BackStackRecord$Op;-><init>()V

    .line 485
    .local v0, "op":Landroid/support/v4/app/BackStackRecord$Op;
    const/4 v1, 0x6

    iput v1, v0, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    .line 486
    iput-object p1, v0, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 487
    invoke-virtual {p0, v0}, Landroid/support/v4/app/BackStackRecord;->addOp(Landroid/support/v4/app/BackStackRecord$Op;)V

    .line 489
    return-object p0
.end method

.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    .line 260
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p3, v0}, Landroid/support/v4/app/BackStackRecord;->dump(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 261
    return-void
.end method

.method public dump(Ljava/lang/String;Ljava/io/PrintWriter;Z)V
    .registers 11
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "writer"    # Ljava/io/PrintWriter;
    .param p3, "full"    # Z

    .prologue
    .line 264
    if-eqz p3, :cond_da

    .line 265
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mName="

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, p0, Landroid/support/v4/app/BackStackRecord;->mName:Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 266
    const-string v5, " mIndex="

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(I)V

    .line 267
    const-string v5, " mCommitted="

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v5, p0, Landroid/support/v4/app/BackStackRecord;->mCommitted:Z

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Z)V

    .line 268
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mTransition:I

    if-eqz v5, :cond_46

    .line 269
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mTransition=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 270
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mTransition:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 271
    const-string v5, " mTransitionStyle=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 272
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mTransitionStyle:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 274
    :cond_46
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mEnterAnim:I

    if-nez v5, :cond_4e

    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mExitAnim:I

    if-eqz v5, :cond_6d

    .line 275
    :cond_4e
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mEnterAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 276
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mEnterAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 277
    const-string v5, " mExitAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 278
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mExitAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 280
    :cond_6d
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mPopEnterAnim:I

    if-nez v5, :cond_75

    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mPopExitAnim:I

    if-eqz v5, :cond_94

    .line 281
    :cond_75
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mPopEnterAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 282
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mPopEnterAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 283
    const-string v5, " mPopExitAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 284
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mPopExitAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 286
    :cond_94
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbTitleRes:I

    if-nez v5, :cond_9c

    iget-object v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbTitleText:Ljava/lang/CharSequence;

    if-eqz v5, :cond_b7

    .line 287
    :cond_9c
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mBreadCrumbTitleRes=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 288
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbTitleRes:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 289
    const-string v5, " mBreadCrumbTitleText="

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 290
    iget-object v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbTitleText:Ljava/lang/CharSequence;

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 292
    :cond_b7
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbShortTitleRes:I

    if-nez v5, :cond_bf

    iget-object v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbShortTitleText:Ljava/lang/CharSequence;

    if-eqz v5, :cond_da

    .line 293
    :cond_bf
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "mBreadCrumbShortTitleRes=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 294
    iget v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbShortTitleRes:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 295
    const-string v5, " mBreadCrumbShortTitleText="

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 296
    iget-object v5, p0, Landroid/support/v4/app/BackStackRecord;->mBreadCrumbShortTitleText:Ljava/lang/CharSequence;

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 300
    :cond_da
    iget-object v5, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    if-eqz v5, :cond_1f5

    .line 301
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "Operations:"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 302
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "    "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 303
    .local v2, "innerPrefix":Ljava/lang/String;
    iget-object v4, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    .line 304
    .local v4, "op":Landroid/support/v4/app/BackStackRecord$Op;
    const/4 v3, 0x0

    .line 305
    .local v3, "num":I
    :goto_fc
    if-eqz v4, :cond_1f5

    .line 307
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    packed-switch v5, :pswitch_data_1f6

    .line 316
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cmd="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v4, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, "cmdStr":Ljava/lang/String;
    :goto_118
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "  Op #"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(I)V

    .line 319
    const-string v5, ": "

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 320
    const-string v5, " "

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 321
    if-eqz p3, :cond_185

    .line 322
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->enterAnim:I

    if-nez v5, :cond_13f

    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->exitAnim:I

    if-eqz v5, :cond_15e

    .line 323
    :cond_13f
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "enterAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 324
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->enterAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 325
    const-string v5, " exitAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 326
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->exitAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 328
    :cond_15e
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->popEnterAnim:I

    if-nez v5, :cond_166

    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->popExitAnim:I

    if-eqz v5, :cond_185

    .line 329
    :cond_166
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "popEnterAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 330
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->popEnterAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 331
    const-string v5, " popExitAnim=#"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 332
    iget v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->popExitAnim:I

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 335
    :cond_185
    iget-object v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    if-eqz v5, :cond_1ef

    iget-object v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1ef

    .line 336
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_192
    iget-object v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v1, v5, :cond_1ef

    .line 337
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 338
    iget-object v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1d7

    .line 339
    const-string v5, "Removed: "

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 347
    :goto_1ab
    iget-object v5, v4, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 336
    add-int/lit8 v1, v1, 0x1

    goto :goto_192

    .line 308
    .end local v0    # "cmdStr":Ljava/lang/String;
    .end local v1    # "i":I
    :pswitch_1b7
    const-string v0, "NULL"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 309
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1bb
    const-string v0, "ADD"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 310
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1bf
    const-string v0, "REPLACE"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 311
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1c3
    const-string v0, "REMOVE"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 312
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1c7
    const-string v0, "HIDE"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 313
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1cb
    const-string v0, "SHOW"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 314
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1cf
    const-string v0, "DETACH"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 315
    .end local v0    # "cmdStr":Ljava/lang/String;
    :pswitch_1d3
    const-string v0, "ATTACH"

    .restart local v0    # "cmdStr":Ljava/lang/String;
    goto/16 :goto_118

    .line 341
    .restart local v1    # "i":I
    :cond_1d7
    if-nez v1, :cond_1de

    .line 342
    const-string v5, "Removed:"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 344
    :cond_1de
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    const-string v5, "  #"

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 345
    const-string v5, ": "

    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_1ab

    .line 350
    .end local v1    # "i":I
    :cond_1ef
    iget-object v4, v4, Landroid/support/v4/app/BackStackRecord$Op;->next:Landroid/support/v4/app/BackStackRecord$Op;

    .line 351
    add-int/lit8 v3, v3, 0x1

    .line 352
    goto/16 :goto_fc

    .line 354
    .end local v0    # "cmdStr":Ljava/lang/String;
    .end local v2    # "innerPrefix":Ljava/lang/String;
    .end local v3    # "num":I
    .end local v4    # "op":Landroid/support/v4/app/BackStackRecord$Op;
    :cond_1f5
    return-void

    .line 307
    :pswitch_data_1f6
    .packed-switch 0x0
        :pswitch_1b7
        :pswitch_1bb
        :pswitch_1bf
        :pswitch_1c3
        :pswitch_1c7
        :pswitch_1cb
        :pswitch_1cf
        :pswitch_1d3
    .end packed-switch
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 973
    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public popFromBackStack(ZLandroid/support/v4/app/BackStackRecord$TransitionState;Landroid/util/SparseArray;Landroid/util/SparseArray;)Landroid/support/v4/app/BackStackRecord$TransitionState;
    .registers 22
    .param p1, "doStateMove"    # Z
    .param p2, "state"    # Landroid/support/v4/app/BackStackRecord$TransitionState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;)",
            "Landroid/support/v4/app/BackStackRecord$TransitionState;"
        }
    .end annotation

    .prologue
    .line 875
    .local p3, "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    .local p4, "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    sget-boolean v13, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v13, :cond_33

    .line 876
    const-string v13, "FragmentManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "popFromBackStack: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 877
    new-instance v5, Landroid/support/v4/util/LogWriter;

    const-string v13, "FragmentManager"

    invoke-direct {v5, v13}, Landroid/support/v4/util/LogWriter;-><init>(Ljava/lang/String;)V

    .line 878
    .local v5, "logw":Landroid/support/v4/util/LogWriter;
    new-instance v10, Ljava/io/PrintWriter;

    invoke-direct {v10, v5}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 879
    .local v10, "pw":Ljava/io/PrintWriter;
    const-string v13, "  "

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v14, v10, v15}, Landroid/support/v4/app/BackStackRecord;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 882
    .end local v5    # "logw":Landroid/support/v4/util/LogWriter;
    .end local v10    # "pw":Ljava/io/PrintWriter;
    :cond_33
    sget-boolean v13, Landroid/support/v4/app/BackStackRecord;->SUPPORTS_TRANSITIONS:Z

    if-eqz v13, :cond_50

    .line 883
    if-nez p2, :cond_88

    .line 884
    invoke-virtual/range {p3 .. p3}, Landroid/util/SparseArray;->size()I

    move-result v13

    if-nez v13, :cond_45

    invoke-virtual/range {p4 .. p4}, Landroid/util/SparseArray;->size()I

    move-result v13

    if-eqz v13, :cond_50

    .line 885
    :cond_45
    const/4 v13, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v13}, Landroid/support/v4/app/BackStackRecord;->beginTransition(Landroid/util/SparseArray;Landroid/util/SparseArray;Z)Landroid/support/v4/app/BackStackRecord$TransitionState;

    move-result-object p2

    .line 892
    :cond_50
    :goto_50
    const/4 v13, -0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Landroid/support/v4/app/BackStackRecord;->bumpBackStackNesting(I)V

    .line 894
    if-eqz p2, :cond_98

    const/4 v12, 0x0

    .line 895
    .local v12, "transitionStyle":I
    :goto_59
    if-eqz p2, :cond_9d

    const/4 v11, 0x0

    .line 896
    .local v11, "transition":I
    :goto_5c
    move-object/from16 v0, p0

    iget-object v7, v0, Landroid/support/v4/app/BackStackRecord;->mTail:Landroid/support/v4/app/BackStackRecord$Op;

    .line 897
    .local v7, "op":Landroid/support/v4/app/BackStackRecord$Op;
    :goto_60
    if-eqz v7, :cond_13b

    .line 898
    if-eqz p2, :cond_a2

    const/4 v8, 0x0

    .line 899
    .local v8, "popEnterAnim":I
    :goto_65
    if-eqz p2, :cond_a5

    const/4 v9, 0x0

    .line 900
    .local v9, "popExitAnim":I
    :goto_68
    iget v13, v7, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    packed-switch v13, :pswitch_data_16c

    .line 952
    new-instance v13, Ljava/lang/IllegalArgumentException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unknown cmd: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v7, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 887
    .end local v7    # "op":Landroid/support/v4/app/BackStackRecord$Op;
    .end local v8    # "popEnterAnim":I
    .end local v9    # "popExitAnim":I
    .end local v11    # "transition":I
    .end local v12    # "transitionStyle":I
    :cond_88
    if-nez p1, :cond_50

    .line 888
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    move-object/from16 v0, p2

    invoke-static {v0, v13, v14}, Landroid/support/v4/app/BackStackRecord;->setNameOverrides(Landroid/support/v4/app/BackStackRecord$TransitionState;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    goto :goto_50

    .line 894
    :cond_98
    move-object/from16 v0, p0

    iget v12, v0, Landroid/support/v4/app/BackStackRecord;->mTransitionStyle:I

    goto :goto_59

    .line 895
    .restart local v12    # "transitionStyle":I
    :cond_9d
    move-object/from16 v0, p0

    iget v11, v0, Landroid/support/v4/app/BackStackRecord;->mTransition:I

    goto :goto_5c

    .line 898
    .restart local v7    # "op":Landroid/support/v4/app/BackStackRecord$Op;
    .restart local v11    # "transition":I
    :cond_a2
    iget v8, v7, Landroid/support/v4/app/BackStackRecord$Op;->popEnterAnim:I

    goto :goto_65

    .line 899
    .restart local v8    # "popEnterAnim":I
    :cond_a5
    iget v9, v7, Landroid/support/v4/app/BackStackRecord$Op;->popExitAnim:I

    goto :goto_68

    .line 902
    .restart local v9    # "popExitAnim":I
    :pswitch_a8
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 903
    .local v3, "f":Landroid/support/v4/app/Fragment;
    iput v9, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 904
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v14

    invoke-virtual {v13, v3, v14, v12}, Landroid/support/v4/app/FragmentManagerImpl;->removeFragment(Landroid/support/v4/app/Fragment;II)V

    .line 956
    :cond_b7
    :goto_b7
    iget-object v7, v7, Landroid/support/v4/app/BackStackRecord$Op;->prev:Landroid/support/v4/app/BackStackRecord$Op;

    .line 957
    goto :goto_60

    .line 908
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_ba
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 909
    .restart local v3    # "f":Landroid/support/v4/app/Fragment;
    if-eqz v3, :cond_cb

    .line 910
    iput v9, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 911
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v14

    invoke-virtual {v13, v3, v14, v12}, Landroid/support/v4/app/FragmentManagerImpl;->removeFragment(Landroid/support/v4/app/Fragment;II)V

    .line 914
    :cond_cb
    iget-object v13, v7, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    if-eqz v13, :cond_b7

    .line 915
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_d0
    iget-object v13, v7, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-ge v4, v13, :cond_b7

    .line 916
    iget-object v13, v7, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/Fragment;

    .line 917
    .local v6, "old":Landroid/support/v4/app/Fragment;
    iput v8, v6, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 918
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    const/4 v14, 0x0

    invoke-virtual {v13, v6, v14}, Landroid/support/v4/app/FragmentManagerImpl;->addFragment(Landroid/support/v4/app/Fragment;Z)V

    .line 915
    add-int/lit8 v4, v4, 0x1

    goto :goto_d0

    .line 923
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    .end local v4    # "i":I
    .end local v6    # "old":Landroid/support/v4/app/Fragment;
    :pswitch_ed
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 924
    .restart local v3    # "f":Landroid/support/v4/app/Fragment;
    iput v8, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 925
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    const/4 v14, 0x0

    invoke-virtual {v13, v3, v14}, Landroid/support/v4/app/FragmentManagerImpl;->addFragment(Landroid/support/v4/app/Fragment;Z)V

    goto :goto_b7

    .line 928
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_fa
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 929
    .restart local v3    # "f":Landroid/support/v4/app/Fragment;
    iput v8, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 930
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v14

    invoke-virtual {v13, v3, v14, v12}, Landroid/support/v4/app/FragmentManagerImpl;->showFragment(Landroid/support/v4/app/Fragment;II)V

    goto :goto_b7

    .line 934
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_10a
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 935
    .restart local v3    # "f":Landroid/support/v4/app/Fragment;
    iput v9, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 936
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v14

    invoke-virtual {v13, v3, v14, v12}, Landroid/support/v4/app/FragmentManagerImpl;->hideFragment(Landroid/support/v4/app/Fragment;II)V

    goto :goto_b7

    .line 940
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_11a
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 941
    .restart local v3    # "f":Landroid/support/v4/app/Fragment;
    iput v8, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 942
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v14

    invoke-virtual {v13, v3, v14, v12}, Landroid/support/v4/app/FragmentManagerImpl;->attachFragment(Landroid/support/v4/app/Fragment;II)V

    goto :goto_b7

    .line 946
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_12a
    iget-object v3, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 947
    .restart local v3    # "f":Landroid/support/v4/app/Fragment;
    iput v8, v3, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 948
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v14

    invoke-virtual {v13, v3, v14, v12}, Landroid/support/v4/app/FragmentManagerImpl;->detachFragment(Landroid/support/v4/app/Fragment;II)V

    goto/16 :goto_b7

    .line 959
    .end local v3    # "f":Landroid/support/v4/app/Fragment;
    .end local v8    # "popEnterAnim":I
    .end local v9    # "popExitAnim":I
    :cond_13b
    if-eqz p1, :cond_154

    .line 960
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget v14, v14, Landroid/support/v4/app/FragmentManagerImpl;->mCurState:I

    invoke-static {v11}, Landroid/support/v4/app/FragmentManagerImpl;->reverseTransit(I)I

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v14, v15, v12, v0}, Landroid/support/v4/app/FragmentManagerImpl;->moveToState(IIIZ)V

    .line 962
    const/16 p2, 0x0

    .line 965
    :cond_154
    move-object/from16 v0, p0

    iget v13, v0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    if-ltz v13, :cond_16a

    .line 966
    move-object/from16 v0, p0

    iget-object v13, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    move-object/from16 v0, p0

    iget v14, v0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    invoke-virtual {v13, v14}, Landroid/support/v4/app/FragmentManagerImpl;->freeBackStackIndex(I)V

    .line 967
    const/4 v13, -0x1

    move-object/from16 v0, p0

    iput v13, v0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    .line 969
    :cond_16a
    return-object p2

    .line 900
    nop

    :pswitch_data_16c
    .packed-switch 0x1
        :pswitch_a8
        :pswitch_ba
        :pswitch_ed
        :pswitch_fa
        :pswitch_10a
        :pswitch_11a
        :pswitch_12a
    .end packed-switch
.end method

.method public remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
    .registers 4
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 457
    new-instance v0, Landroid/support/v4/app/BackStackRecord$Op;

    invoke-direct {v0}, Landroid/support/v4/app/BackStackRecord$Op;-><init>()V

    .line 458
    .local v0, "op":Landroid/support/v4/app/BackStackRecord$Op;
    const/4 v1, 0x3

    iput v1, v0, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    .line 459
    iput-object p1, v0, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 460
    invoke-virtual {p0, v0}, Landroid/support/v4/app/BackStackRecord;->addOp(Landroid/support/v4/app/BackStackRecord$Op;)V

    .line 462
    return-object p0
.end method

.method public replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
    .registers 4
    .param p1, "containerViewId"    # I
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 444
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/app/BackStackRecord;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    return-object v0
.end method

.method public replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
    .registers 6
    .param p1, "containerViewId"    # I
    .param p2, "fragment"    # Landroid/support/v4/app/Fragment;
    .param p3, "tag"    # Ljava/lang/String;

    .prologue
    .line 448
    if-nez p1, :cond_a

    .line 449
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Must use non-zero containerViewId"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 452
    :cond_a
    const/4 v0, 0x2

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/app/BackStackRecord;->doAddOp(ILandroid/support/v4/app/Fragment;Ljava/lang/String;I)V

    .line 453
    return-object p0
.end method

.method public run()V
    .registers 15

    .prologue
    .line 642
    sget-boolean v11, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v11, :cond_1c

    const-string v11, "FragmentManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Run: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    :cond_1c
    iget-boolean v11, p0, Landroid/support/v4/app/BackStackRecord;->mAddToBackStack:Z

    if-eqz v11, :cond_2c

    .line 645
    iget v11, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    if-gez v11, :cond_2c

    .line 646
    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "addToBackStack() called after commit()"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 650
    :cond_2c
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Landroid/support/v4/app/BackStackRecord;->bumpBackStackNesting(I)V

    .line 652
    const/4 v8, 0x0

    .line 653
    .local v8, "state":Landroid/support/v4/app/BackStackRecord$TransitionState;
    const/4 v3, 0x0

    .line 654
    .local v3, "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    const/4 v5, 0x0

    .line 655
    .local v5, "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    sget-boolean v11, Landroid/support/v4/app/BackStackRecord;->SUPPORTS_TRANSITIONS:Z

    if-eqz v11, :cond_49

    .line 656
    new-instance v3, Landroid/util/SparseArray;

    .end local v3    # "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 657
    .restart local v3    # "firstOutFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    new-instance v5, Landroid/util/SparseArray;

    .end local v5    # "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 659
    .restart local v5    # "lastInFragments":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/v4/app/Fragment;>;"
    invoke-direct {p0, v3, v5}, Landroid/support/v4/app/BackStackRecord;->calculateFragments(Landroid/util/SparseArray;Landroid/util/SparseArray;)V

    .line 661
    const/4 v11, 0x0

    invoke-direct {p0, v3, v5, v11}, Landroid/support/v4/app/BackStackRecord;->beginTransition(Landroid/util/SparseArray;Landroid/util/SparseArray;Z)Landroid/support/v4/app/BackStackRecord$TransitionState;

    move-result-object v8

    .line 664
    :cond_49
    if-eqz v8, :cond_79

    const/4 v10, 0x0

    .line 665
    .local v10, "transitionStyle":I
    :goto_4c
    if-eqz v8, :cond_7c

    const/4 v9, 0x0

    .line 666
    .local v9, "transition":I
    :goto_4f
    iget-object v7, p0, Landroid/support/v4/app/BackStackRecord;->mHead:Landroid/support/v4/app/BackStackRecord$Op;

    .line 667
    .local v7, "op":Landroid/support/v4/app/BackStackRecord$Op;
    :goto_51
    if-eqz v7, :cond_172

    .line 668
    if-eqz v8, :cond_7f

    const/4 v0, 0x0

    .line 669
    .local v0, "enterAnim":I
    :goto_56
    if-eqz v8, :cond_82

    const/4 v1, 0x0

    .line 670
    .local v1, "exitAnim":I
    :goto_59
    iget v11, v7, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    packed-switch v11, :pswitch_data_186

    .line 733
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Unknown cmd: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, v7, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 664
    .end local v0    # "enterAnim":I
    .end local v1    # "exitAnim":I
    .end local v7    # "op":Landroid/support/v4/app/BackStackRecord$Op;
    .end local v9    # "transition":I
    .end local v10    # "transitionStyle":I
    :cond_79
    iget v10, p0, Landroid/support/v4/app/BackStackRecord;->mTransitionStyle:I

    goto :goto_4c

    .line 665
    .restart local v10    # "transitionStyle":I
    :cond_7c
    iget v9, p0, Landroid/support/v4/app/BackStackRecord;->mTransition:I

    goto :goto_4f

    .line 668
    .restart local v7    # "op":Landroid/support/v4/app/BackStackRecord$Op;
    .restart local v9    # "transition":I
    :cond_7f
    iget v0, v7, Landroid/support/v4/app/BackStackRecord$Op;->enterAnim:I

    goto :goto_56

    .line 669
    .restart local v0    # "enterAnim":I
    :cond_82
    iget v1, v7, Landroid/support/v4/app/BackStackRecord$Op;->exitAnim:I

    goto :goto_59

    .line 672
    .restart local v1    # "exitAnim":I
    :pswitch_85
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 673
    .local v2, "f":Landroid/support/v4/app/Fragment;
    iput v0, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 674
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    const/4 v12, 0x0

    invoke-virtual {v11, v2, v12}, Landroid/support/v4/app/FragmentManagerImpl;->addFragment(Landroid/support/v4/app/Fragment;Z)V

    .line 737
    :cond_8f
    :goto_8f
    iget-object v7, v7, Landroid/support/v4/app/BackStackRecord$Op;->next:Landroid/support/v4/app/BackStackRecord$Op;

    .line 738
    goto :goto_51

    .line 677
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_92
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 678
    .restart local v2    # "f":Landroid/support/v4/app/Fragment;
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v11, v11, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    if-eqz v11, :cond_12f

    .line 679
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_9b
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v11, v11, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-ge v4, v11, :cond_12f

    .line 680
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v11, v11, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/Fragment;

    .line 681
    .local v6, "old":Landroid/support/v4/app/Fragment;
    sget-boolean v11, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v11, :cond_d5

    const-string v11, "FragmentManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "OP_REPLACE: adding="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " old="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 683
    :cond_d5
    if-eqz v2, :cond_dd

    iget v11, v6, Landroid/support/v4/app/Fragment;->mContainerId:I

    iget v12, v2, Landroid/support/v4/app/Fragment;->mContainerId:I

    if-ne v11, v12, :cond_e2

    .line 684
    :cond_dd
    if-ne v6, v2, :cond_e5

    .line 685
    const/4 v2, 0x0

    iput-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 679
    :cond_e2
    :goto_e2
    add-int/lit8 v4, v4, 0x1

    goto :goto_9b

    .line 687
    :cond_e5
    iget-object v11, v7, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    if-nez v11, :cond_f0

    .line 688
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, v7, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    .line 690
    :cond_f0
    iget-object v11, v7, Landroid/support/v4/app/BackStackRecord$Op;->removed:Ljava/util/ArrayList;

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 691
    iput v1, v6, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 692
    iget-boolean v11, p0, Landroid/support/v4/app/BackStackRecord;->mAddToBackStack:Z

    if-eqz v11, :cond_129

    .line 693
    iget v11, v6, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    add-int/lit8 v11, v11, 0x1

    iput v11, v6, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    .line 694
    sget-boolean v11, Landroid/support/v4/app/FragmentManagerImpl;->DEBUG:Z

    if-eqz v11, :cond_129

    const-string v11, "FragmentManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Bump nesting of "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " to "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, v6, Landroid/support/v4/app/Fragment;->mBackStackNesting:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 697
    :cond_129
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, v6, v9, v10}, Landroid/support/v4/app/FragmentManagerImpl;->removeFragment(Landroid/support/v4/app/Fragment;II)V

    goto :goto_e2

    .line 702
    .end local v4    # "i":I
    .end local v6    # "old":Landroid/support/v4/app/Fragment;
    :cond_12f
    if-eqz v2, :cond_8f

    .line 703
    iput v0, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 704
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    const/4 v12, 0x0

    invoke-virtual {v11, v2, v12}, Landroid/support/v4/app/FragmentManagerImpl;->addFragment(Landroid/support/v4/app/Fragment;Z)V

    goto/16 :goto_8f

    .line 708
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_13b
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 709
    .restart local v2    # "f":Landroid/support/v4/app/Fragment;
    iput v1, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 710
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, v2, v9, v10}, Landroid/support/v4/app/FragmentManagerImpl;->removeFragment(Landroid/support/v4/app/Fragment;II)V

    goto/16 :goto_8f

    .line 713
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_146
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 714
    .restart local v2    # "f":Landroid/support/v4/app/Fragment;
    iput v1, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 715
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, v2, v9, v10}, Landroid/support/v4/app/FragmentManagerImpl;->hideFragment(Landroid/support/v4/app/Fragment;II)V

    goto/16 :goto_8f

    .line 718
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_151
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 719
    .restart local v2    # "f":Landroid/support/v4/app/Fragment;
    iput v0, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 720
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, v2, v9, v10}, Landroid/support/v4/app/FragmentManagerImpl;->showFragment(Landroid/support/v4/app/Fragment;II)V

    goto/16 :goto_8f

    .line 723
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_15c
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 724
    .restart local v2    # "f":Landroid/support/v4/app/Fragment;
    iput v1, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 725
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, v2, v9, v10}, Landroid/support/v4/app/FragmentManagerImpl;->detachFragment(Landroid/support/v4/app/Fragment;II)V

    goto/16 :goto_8f

    .line 728
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :pswitch_167
    iget-object v2, v7, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    .line 729
    .restart local v2    # "f":Landroid/support/v4/app/Fragment;
    iput v0, v2, Landroid/support/v4/app/Fragment;->mNextAnim:I

    .line 730
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, v2, v9, v10}, Landroid/support/v4/app/FragmentManagerImpl;->attachFragment(Landroid/support/v4/app/Fragment;II)V

    goto/16 :goto_8f

    .line 740
    .end local v0    # "enterAnim":I
    .end local v1    # "exitAnim":I
    .end local v2    # "f":Landroid/support/v4/app/Fragment;
    :cond_172
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v12, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget v12, v12, Landroid/support/v4/app/FragmentManagerImpl;->mCurState:I

    const/4 v13, 0x1

    invoke-virtual {v11, v12, v9, v10, v13}, Landroid/support/v4/app/FragmentManagerImpl;->moveToState(IIIZ)V

    .line 742
    iget-boolean v11, p0, Landroid/support/v4/app/BackStackRecord;->mAddToBackStack:Z

    if-eqz v11, :cond_185

    .line 743
    iget-object v11, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    invoke-virtual {v11, p0}, Landroid/support/v4/app/FragmentManagerImpl;->addBackStackState(Landroid/support/v4/app/BackStackRecord;)V

    .line 745
    :cond_185
    return-void

    .line 670
    :pswitch_data_186
    .packed-switch 0x1
        :pswitch_85
        :pswitch_92
        :pswitch_13b
        :pswitch_146
        :pswitch_151
        :pswitch_15c
        :pswitch_167
    .end packed-switch
.end method

.method public setCustomAnimations(II)Landroid/support/v4/app/FragmentTransaction;
    .registers 4
    .param p1, "enter"    # I
    .param p2, "exit"    # I

    .prologue
    const/4 v0, 0x0

    .line 502
    invoke-virtual {p0, p1, p2, v0, v0}, Landroid/support/v4/app/BackStackRecord;->setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    return-object v0
.end method

.method public setCustomAnimations(IIII)Landroid/support/v4/app/FragmentTransaction;
    .registers 5
    .param p1, "enter"    # I
    .param p2, "exit"    # I
    .param p3, "popEnter"    # I
    .param p4, "popExit"    # I

    .prologue
    .line 507
    iput p1, p0, Landroid/support/v4/app/BackStackRecord;->mEnterAnim:I

    .line 508
    iput p2, p0, Landroid/support/v4/app/BackStackRecord;->mExitAnim:I

    .line 509
    iput p3, p0, Landroid/support/v4/app/BackStackRecord;->mPopEnterAnim:I

    .line 510
    iput p4, p0, Landroid/support/v4/app/BackStackRecord;->mPopExitAnim:I

    .line 511
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 245
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "BackStackEntry{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    iget v1, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    if-ltz v1, :cond_25

    .line 248
    const-string v1, " #"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    iget v1, p0, Landroid/support/v4/app/BackStackRecord;->mIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    :cond_25
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mName:Ljava/lang/String;

    if-eqz v1, :cond_33

    .line 252
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    iget-object v1, p0, Landroid/support/v4/app/BackStackRecord;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    :cond_33
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
