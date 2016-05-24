.class public Lit/sephiroth/android/library/tooltip/TooltipManager;
.super Ljava/lang/Object;
.source "TooltipManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;,
        Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;,
        Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;,
        Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;,
        Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;
    }
.end annotation


# static fields
.field private static instances:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lit/sephiroth/android/library/tooltip/TooltipManager;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final lock:Ljava/lang/Object;

.field final mActivity:Landroid/app/Activity;

.field private mCloseListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

.field private final mTooltipAttachStatusListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;",
            ">;"
        }
    .end annotation
.end field

.field private mTooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

.field final mTooltips:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lit/sephiroth/android/library/tooltip/TooltipView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/tooltip/TooltipManager;->instances:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipAttachStatusListeners:Ljava/util/List;

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltips:Ljava/util/HashMap;

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->lock:Ljava/lang/Object;

    .line 34
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$1;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/tooltip/TooltipManager$1;-><init>(Lit/sephiroth/android/library/tooltip/TooltipManager;)V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mCloseListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

    .line 42
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$2;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/tooltip/TooltipManager$2;-><init>(Lit/sephiroth/android/library/tooltip/TooltipManager;)V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    .line 66
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mActivity:Landroid/app/Activity;

    .line 67
    return-void
.end method

.method static synthetic access$000(Lit/sephiroth/android/library/tooltip/TooltipManager;)V
    .registers 1
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipManager;

    .prologue
    .line 16
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipManager;->printStats()V

    return-void
.end method

.method static synthetic access$100(Lit/sephiroth/android/library/tooltip/TooltipManager;I)V
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipManager;
    .param p1, "x1"    # I

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->fireOnTooltipDetached(I)V

    return-void
.end method

.method static synthetic access$200(Lit/sephiroth/android/library/tooltip/TooltipManager;Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;Z)Z
    .registers 4
    .param p0, "x0"    # Lit/sephiroth/android/library/tooltip/TooltipManager;
    .param p1, "x1"    # Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .param p2, "x2"    # Z

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/tooltip/TooltipManager;->show(Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;Z)Z

    move-result v0

    return v0
.end method

.method private fireOnTooltipAttached(I)V
    .registers 5
    .param p1, "id"    # I

    .prologue
    .line 88
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipAttachStatusListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1e

    .line 89
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipAttachStatusListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;

    .line 90
    .local v1, "listener":Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;
    invoke-interface {v1, p1}, Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;->onTooltipAttached(I)V

    goto :goto_e

    .line 93
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;
    :cond_1e
    return-void
.end method

.method private fireOnTooltipDetached(I)V
    .registers 5
    .param p1, "id"    # I

    .prologue
    .line 80
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipAttachStatusListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1e

    .line 81
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipAttachStatusListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;

    .line 82
    .local v1, "listener":Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;
    invoke-interface {v1, p1}, Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;->onTooltipDetached(I)V

    goto :goto_e

    .line 85
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lit/sephiroth/android/library/tooltip/TooltipManager$OnTooltipAttachedStateChange;
    :cond_1e
    return-void
.end method

.method public static getInstance(Landroid/app/Activity;)Lit/sephiroth/android/library/tooltip/TooltipManager;
    .registers 8
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 439
    sget-object v3, Lit/sephiroth/android/library/tooltip/TooltipManager;->instances:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/sephiroth/android/library/tooltip/TooltipManager;

    .line 446
    .local v1, "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    if-nez v1, :cond_41

    .line 447
    const-class v4, Lit/sephiroth/android/library/tooltip/TooltipManager;

    monitor-enter v4

    .line 448
    :try_start_15
    sget-object v3, Lit/sephiroth/android/library/tooltip/TooltipManager;->instances:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipManager;

    move-object v1, v0

    .line 449
    if-nez v1, :cond_40

    .line 450
    const-class v5, Lit/sephiroth/android/library/tooltip/TooltipManager;

    monitor-enter v5
    :try_end_2c
    .catchall {:try_start_15 .. :try_end_2c} :catchall_45

    .line 451
    :try_start_2c
    new-instance v2, Lit/sephiroth/android/library/tooltip/TooltipManager;

    invoke-direct {v2, p0}, Lit/sephiroth/android/library/tooltip/TooltipManager;-><init>(Landroid/app/Activity;)V
    :try_end_31
    .catchall {:try_start_2c .. :try_end_31} :catchall_42

    .line 452
    .end local v1    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    .local v2, "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    :try_start_31
    sget-object v3, Lit/sephiroth/android/library/tooltip/TooltipManager;->instances:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6, v2}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    monitor-exit v5
    :try_end_3f
    .catchall {:try_start_31 .. :try_end_3f} :catchall_48

    move-object v1, v2

    .line 455
    .end local v2    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    .restart local v1    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    :cond_40
    :try_start_40
    monitor-exit v4
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_45

    .line 457
    :cond_41
    return-object v1

    .line 453
    :catchall_42
    move-exception v3

    :goto_43
    :try_start_43
    monitor-exit v5
    :try_end_44
    .catchall {:try_start_43 .. :try_end_44} :catchall_42

    :try_start_44
    throw v3

    .line 455
    :catchall_45
    move-exception v3

    monitor-exit v4
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_45

    throw v3

    .line 453
    .end local v1    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    .restart local v2    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    :catchall_48
    move-exception v3

    move-object v1, v2

    .end local v2    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    .restart local v1    # "sInstance":Lit/sephiroth/android/library/tooltip/TooltipManager;
    goto :goto_43
.end method

.method private printStats()V
    .registers 1

    .prologue
    .line 187
    return-void
.end method

.method private show(Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;Z)Z
    .registers 7
    .param p1, "builder"    # Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .param p2, "immediate"    # Z

    .prologue
    .line 102
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 103
    :try_start_3
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltips:Ljava/util/HashMap;

    iget v3, p1, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 104
    const-string v1, "TooltipManager"

    const-string v3, "A Tooltip with the same id was walready specified"

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const/4 v1, 0x0

    monitor-exit v2

    .line 115
    :goto_1a
    return v1

    .line 108
    :cond_1b
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipView;

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1, p1}, Lit/sephiroth/android/library/tooltip/TooltipView;-><init>(Landroid/content/Context;Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;)V

    .line 109
    .local v0, "layout":Lit/sephiroth/android/library/tooltip/TooltipView;
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mCloseListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->setOnCloseListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;)V

    .line 110
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltipListener:Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->setOnToolTipListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;)V

    .line 111
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltips:Ljava/util/HashMap;

    iget v3, p1, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    invoke-direct {p0, v0, p2}, Lit/sephiroth/android/library/tooltip/TooltipManager;->showInternal(Lit/sephiroth/android/library/tooltip/TooltipView;Z)V

    .line 113
    monitor-exit v2
    :try_end_3b
    .catchall {:try_start_3 .. :try_end_3b} :catchall_40

    .line 114
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipManager;->printStats()V

    .line 115
    const/4 v1, 0x1

    goto :goto_1a

    .line 113
    .end local v0    # "layout":Lit/sephiroth/android/library/tooltip/TooltipView;
    :catchall_40
    move-exception v1

    :try_start_41
    monitor-exit v2
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_40

    throw v1
.end method

.method private showInternal(Lit/sephiroth/android/library/tooltip/TooltipView;Z)V
    .registers 7
    .param p1, "layout"    # Lit/sephiroth/android/library/tooltip/TooltipView;
    .param p2, "immediate"    # Z

    .prologue
    const/4 v3, -0x1

    .line 201
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mActivity:Landroid/app/Activity;

    if-eqz v2, :cond_13

    .line 202
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 203
    .local v0, "decor":Landroid/view/ViewGroup;
    if-nez v0, :cond_14

    .line 216
    .end local v0    # "decor":Landroid/view/ViewGroup;
    :cond_13
    :goto_13
    return-void

    .line 204
    .restart local v0    # "decor":Landroid/view/ViewGroup;
    :cond_14
    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_22

    .line 206
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 207
    .local v1, "params":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v0, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    .end local v1    # "params":Landroid/view/ViewGroup$LayoutParams;
    :cond_22
    if-eqz p2, :cond_27

    .line 211
    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->show()V

    .line 214
    :cond_27
    invoke-virtual {p1}, Lit/sephiroth/android/library/tooltip/TooltipView;->getTooltipId()I

    move-result v2

    invoke-direct {p0, v2}, Lit/sephiroth/android/library/tooltip/TooltipManager;->fireOnTooltipAttached(I)V

    goto :goto_13
.end method


# virtual methods
.method public create(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 96
    new-instance v0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    invoke-direct {v0, p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;-><init>(Lit/sephiroth/android/library/tooltip/TooltipManager;I)V

    return-object v0
.end method

.method public hide(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 122
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 123
    :try_start_3
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltips:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipView;

    .line 124
    .local v0, "layout":Lit/sephiroth/android/library/tooltip/TooltipView;
    monitor-exit v2
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_1e

    .line 125
    if-eqz v0, :cond_1d

    .line 126
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->setOnCloseListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;)V

    .line 127
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/tooltip/TooltipView;->hide(Z)V

    .line 128
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipManager;->printStats()V

    .line 130
    :cond_1d
    return-void

    .line 124
    .end local v0    # "layout":Lit/sephiroth/android/library/tooltip/TooltipView;
    :catchall_1e
    move-exception v1

    :try_start_1f
    monitor-exit v2
    :try_end_20
    .catchall {:try_start_1f .. :try_end_20} :catchall_1e

    throw v1
.end method

.method public remove(I)V
    .registers 7
    .param p1, "id"    # I

    .prologue
    const/4 v4, 0x0

    .line 160
    iget-object v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 161
    :try_start_4
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager;->mTooltips:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipView;

    .line 162
    .local v0, "layout":Lit/sephiroth/android/library/tooltip/TooltipView;
    monitor-exit v2
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_23

    .line 164
    if-eqz v0, :cond_1f

    .line 165
    invoke-virtual {v0, v4}, Lit/sephiroth/android/library/tooltip/TooltipView;->setOnCloseListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnCloseListener;)V

    .line 166
    invoke-virtual {v0, v4}, Lit/sephiroth/android/library/tooltip/TooltipView;->setOnToolTipListener(Lit/sephiroth/android/library/tooltip/TooltipView$OnToolTipListener;)V

    .line 167
    invoke-virtual {v0}, Lit/sephiroth/android/library/tooltip/TooltipView;->removeFromParent()V

    .line 168
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipManager;->fireOnTooltipDetached(I)V

    .line 170
    :cond_1f
    invoke-direct {p0}, Lit/sephiroth/android/library/tooltip/TooltipManager;->printStats()V

    .line 171
    return-void

    .line 162
    .end local v0    # "layout":Lit/sephiroth/android/library/tooltip/TooltipView;
    :catchall_23
    move-exception v1

    :try_start_24
    monitor-exit v2
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_23

    throw v1
.end method
