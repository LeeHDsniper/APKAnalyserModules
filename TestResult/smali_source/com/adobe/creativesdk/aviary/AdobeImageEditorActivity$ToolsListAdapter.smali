.class final Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ToolsListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;,
        Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsListFeedbackEvent;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field mHideFeedback:Z

.field mInflater:Landroid/view/LayoutInflater;

.field mObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;",
            ">;"
        }
    .end annotation
.end field

.field mToolDefaultWidth:I

.field mToolViewWidth:I

.field mViewWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Z)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "hideFeedback"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p2, "objects":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;>;"
    const/4 v5, 0x1

    const-wide/high16 v10, 0x3fe0000000000000L

    .line 1613
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 1614
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mViewWidth:I

    .line 1615
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_bottombar_tool_item_min_width:I

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iput v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolDefaultWidth:I

    .line 1616
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 1617
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mObjects:Ljava/util/List;

    .line 1618
    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mHideFeedback:Z

    .line 1620
    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mViewWidth:I

    int-to-double v6, v4

    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolDefaultWidth:I

    int-to-double v8, v4

    div-double v0, v6, v8

    .line 1621
    .local v0, "numberOfItems":D
    const-wide/high16 v6, 0x3ff0000000000000L

    rem-double v2, v0, v6

    .line 1624
    .local v2, "rest":D
    const-wide v6, 0x3fd3333333333333L

    cmpg-double v4, v2, v6

    if-ltz v4, :cond_46

    const-wide v6, 0x3fe6666666666666L

    cmpl-double v4, v2, v6

    if-lez v4, :cond_7a

    .line 1625
    :cond_46
    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mViewWidth:I

    int-to-double v6, v4

    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolDefaultWidth:I

    int-to-double v8, v4

    div-double/2addr v6, v8

    .line 1626
    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    sub-double v8, v10, v2

    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    cmpl-double v4, v2, v10

    if-lez v4, :cond_78

    move v4, v5

    :goto_5c
    int-to-double v10, v4

    mul-double/2addr v8, v10

    add-double v0, v6, v8

    .line 1627
    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mViewWidth:I

    int-to-double v6, v4

    div-double/2addr v6, v0

    double-to-int v4, v6

    iput v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolViewWidth:I

    .line 1628
    sget-object v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "numberOfItems: %g"

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-interface {v4, v6, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1633
    :goto_77
    return-void

    .line 1626
    :cond_78
    const/4 v4, -0x1

    goto :goto_5c

    .line 1630
    :cond_7a
    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolDefaultWidth:I

    iput v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolViewWidth:I

    goto :goto_77
.end method


# virtual methods
.method public getItemCount()I
    .registers 2

    .prologue
    .line 1693
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mObjects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 1688
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1675
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_10

    .line 1676
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mHideFeedback:Z

    if-eqz v0, :cond_e

    .line 1677
    const/4 v0, 0x2

    .line 1682
    :goto_d
    return v0

    .line 1679
    :cond_e
    const/4 v0, 0x1

    goto :goto_d

    .line 1682
    :cond_10
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3

    .prologue
    .line 1578
    check-cast p1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->onBindViewHolder(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;I)V
    .registers 8
    .param p1, "holder"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 1659
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;->getItemViewType()I

    move-result v1

    .line 1660
    .local v1, "type":I
    if-nez v1, :cond_21

    .line 1661
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mObjects:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .line 1663
    .local v0, "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    iget-object v2, p1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;->itemView:Landroid/view/View;

    .line 1664
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1666
    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;->textView:Landroid/widget/TextView;

    iget v4, v0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->labelResourceId:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 1667
    iget-object v3, p1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;->imageView:Landroid/widget/ImageView;

    iget v4, v0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->iconResourceId:I

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1670
    .end local v0    # "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .end local v2    # "view":Landroid/view/View;
    :cond_21
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1594
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .line 1595
    .local v0, "tag":Ljava/lang/Object;
    instance-of v1, v0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    if-eqz v1, :cond_10

    .line 1596
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    invoke-virtual {v1, v0}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    .line 1600
    :cond_f
    :goto_f
    return-void

    .line 1597
    :cond_10
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mHideFeedback:Z

    if-nez v1, :cond_f

    .line 1598
    invoke-static {}, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->getInstance()Lde/greenrobot/event/EventBus;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsListFeedbackEvent;

    invoke-direct {v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsListFeedbackEvent;-><init>()V

    invoke-virtual {v1, v2}, Lde/greenrobot/event/EventBus;->post(Ljava/lang/Object;)V

    goto :goto_f
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4

    .prologue
    .line 1578
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;
    .registers 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v3, 0x0

    .line 1640
    if-nez p2, :cond_1f

    .line 1641
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mInflater:Landroid/view/LayoutInflater;

    sget v2, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_tool_item_layout:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 1642
    .local v0, "view":Landroid/view/View;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mToolViewWidth:I

    const/4 v3, -0x1

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1649
    :goto_16
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1651
    new-instance v1, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;

    invoke-direct {v1, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter$ToolsViewHolder;-><init>(Landroid/view/View;)V

    return-object v1

    .line 1643
    .end local v0    # "view":Landroid/view/View;
    :cond_1f
    const/4 v1, 0x1

    if-ne p2, v1, :cond_2b

    .line 1644
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mInflater:Landroid/view/LayoutInflater;

    sget v2, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_feedback_item_layout:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .restart local v0    # "view":Landroid/view/View;
    goto :goto_16

    .line 1646
    .end local v0    # "view":Landroid/view/View;
    :cond_2b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$ToolsListAdapter;->mInflater:Landroid/view/LayoutInflater;

    sget v2, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_branding_item_layout:I

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .restart local v0    # "view":Landroid/view/View;
    goto :goto_16
.end method
