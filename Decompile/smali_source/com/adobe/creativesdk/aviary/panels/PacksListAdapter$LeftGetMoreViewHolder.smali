.class Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$LeftGetMoreViewHolder;
.super Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
.source "PacksListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LeftGetMoreViewHolder"
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 552
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;-><init>(Landroid/view/View;)V

    .line 553
    return-void
.end method
