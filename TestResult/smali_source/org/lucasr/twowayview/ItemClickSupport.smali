.class public Lorg/lucasr/twowayview/ItemClickSupport;
.super Ljava/lang/Object;
.source "ItemClickSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;,
        Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;,
        Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;
    }
.end annotation


# instance fields
.field private mItemClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;

.field private mItemLongClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;

.field private final mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final mTouchListener:Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 56
    new-instance v0, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;

    invoke-direct {v0, p0, p1}, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;-><init>(Lorg/lucasr/twowayview/ItemClickSupport;Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mTouchListener:Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;

    .line 57
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mTouchListener:Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    .line 58
    return-void
.end method

.method static synthetic access$000(Lorg/lucasr/twowayview/ItemClickSupport;)Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/ItemClickSupport;

    .prologue
    .line 10
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mItemClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lorg/lucasr/twowayview/ItemClickSupport;)Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;
    .registers 2
    .param p0, "x0"    # Lorg/lucasr/twowayview/ItemClickSupport;

    .prologue
    .line 10
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mItemLongClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;

    return-object v0
.end method

.method public static addTo(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemClickSupport;
    .registers 3
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 85
    invoke-static {p0}, Lorg/lucasr/twowayview/ItemClickSupport;->from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemClickSupport;

    move-result-object v0

    .line 86
    .local v0, "itemClickSupport":Lorg/lucasr/twowayview/ItemClickSupport;
    if-nez v0, :cond_10

    .line 87
    new-instance v0, Lorg/lucasr/twowayview/ItemClickSupport;

    .end local v0    # "itemClickSupport":Lorg/lucasr/twowayview/ItemClickSupport;
    invoke-direct {v0, p0}, Lorg/lucasr/twowayview/ItemClickSupport;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    .line 88
    .restart local v0    # "itemClickSupport":Lorg/lucasr/twowayview/ItemClickSupport;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->twowayview_item_click_support:I

    invoke-virtual {p0, v1, v0}, Landroid/support/v7/widget/RecyclerView;->setTag(ILjava/lang/Object;)V

    .line 93
    :cond_10
    return-object v0
.end method

.method public static from(Landroid/support/v7/widget/RecyclerView;)Lorg/lucasr/twowayview/ItemClickSupport;
    .registers 2
    .param p0, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 108
    if-nez p0, :cond_4

    .line 109
    const/4 v0, 0x0

    .line 112
    :goto_3
    return-object v0

    :cond_4
    sget v0, Lcom/adobe/creativesdk/foundation/assets/R$id;->twowayview_item_click_support:I

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/lucasr/twowayview/ItemClickSupport;

    goto :goto_3
.end method


# virtual methods
.method public setOnItemClickListener(Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;)V
    .registers 2
    .param p1, "listener"    # Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mItemClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;

    .line 68
    return-void
.end method

.method public setOnItemLongClickListener(Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;)V
    .registers 4
    .param p1, "listener"    # Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;

    .prologue
    .line 77
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->isLongClickable()Z

    move-result v0

    if-nez v0, :cond_e

    .line 78
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLongClickable(Z)V

    .line 81
    :cond_e
    iput-object p1, p0, Lorg/lucasr/twowayview/ItemClickSupport;->mItemLongClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;

    .line 82
    return-void
.end method
