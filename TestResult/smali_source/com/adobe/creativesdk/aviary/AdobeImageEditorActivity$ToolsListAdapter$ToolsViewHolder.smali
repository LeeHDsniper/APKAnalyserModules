.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AdobeImageEditorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ToolsViewHolder"
.end annotation


# instance fields
.field final imageView:Landroid/widget/ImageView;

.field final textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 1607
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1608
    const v0, 0x1020006

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;->imageView:Landroid/widget/ImageView;

    .line 1609
    const v0, 0x1020014

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;->textView:Landroid/widget/TextView;

    .line 1610
    return-void
.end method
