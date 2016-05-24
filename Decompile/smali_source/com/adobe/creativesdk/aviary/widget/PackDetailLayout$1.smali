.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "PackDetailLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    .line 119
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    .line 124
    return-void
.end method
