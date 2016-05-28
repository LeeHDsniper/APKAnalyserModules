.class Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;
.super Lorg/lucasr/twowayview/ClickItemTouchListener;
.source "ItemClickSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/lucasr/twowayview/ItemClickSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TouchListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/lucasr/twowayview/ItemClickSupport;


# direct methods
.method constructor <init>(Lorg/lucasr/twowayview/ItemClickSupport;Landroid/support/v7/widget/RecyclerView;)V
    .registers 3
    .param p2, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;->this$0:Lorg/lucasr/twowayview/ItemClickSupport;

    .line 117
    invoke-direct {p0, p2}, Lorg/lucasr/twowayview/ClickItemTouchListener;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    .line 118
    return-void
.end method


# virtual methods
.method performItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
    .registers 12
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    const/4 v0, 0x0

    .line 122
    iget-object v1, p0, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;->this$0:Lorg/lucasr/twowayview/ItemClickSupport;

    # getter for: Lorg/lucasr/twowayview/ItemClickSupport;->mItemClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;
    invoke-static {v1}, Lorg/lucasr/twowayview/ItemClickSupport;->access$000(Lorg/lucasr/twowayview/ItemClickSupport;)Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;

    move-result-object v1

    if-eqz v1, :cond_1a

    .line 123
    invoke-virtual {p2, v0}, Landroid/view/View;->playSoundEffect(I)V

    .line 124
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;->this$0:Lorg/lucasr/twowayview/ItemClickSupport;

    # getter for: Lorg/lucasr/twowayview/ItemClickSupport;->mItemClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;
    invoke-static {v0}, Lorg/lucasr/twowayview/ItemClickSupport;->access$000(Lorg/lucasr/twowayview/ItemClickSupport;)Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Lorg/lucasr/twowayview/ItemClickSupport$OnItemClickListener;->onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)V

    .line 125
    const/4 v0, 0x1

    .line 128
    :cond_1a
    return v0
.end method

.method performItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
    .registers 12
    .param p1, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    const/4 v0, 0x0

    .line 133
    iget-object v1, p0, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;->this$0:Lorg/lucasr/twowayview/ItemClickSupport;

    # getter for: Lorg/lucasr/twowayview/ItemClickSupport;->mItemLongClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;
    invoke-static {v1}, Lorg/lucasr/twowayview/ItemClickSupport;->access$100(Lorg/lucasr/twowayview/ItemClickSupport;)Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;

    move-result-object v1

    if-eqz v1, :cond_1a

    .line 134
    invoke-virtual {p2, v0}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 135
    iget-object v0, p0, Lorg/lucasr/twowayview/ItemClickSupport$TouchListener;->this$0:Lorg/lucasr/twowayview/ItemClickSupport;

    # getter for: Lorg/lucasr/twowayview/ItemClickSupport;->mItemLongClickListener:Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;
    invoke-static {v0}, Lorg/lucasr/twowayview/ItemClickSupport;->access$100(Lorg/lucasr/twowayview/ItemClickSupport;)Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Lorg/lucasr/twowayview/ItemClickSupport$OnItemLongClickListener;->onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z

    move-result v0

    .line 138
    :cond_1a
    return v0
.end method
