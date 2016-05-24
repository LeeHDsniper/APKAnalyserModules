.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "AdobeAssetOneUpRecyclerViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->performInitialization(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .registers 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "newState"    # I

    .prologue
    .line 191
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 21
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 160
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget v12, v12, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->num_pages:I

    const/4 v13, 0x1

    if-le v12, v13, :cond_a2

    .line 161
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v12, v12, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v12}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v6

    .local v6, "posF":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v12, v12, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v12}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v7

    .line 162
    .local v7, "posL":I
    move v5, v6

    .line 163
    .local v5, "pos":I
    const/4 v12, -0x1

    if-eq v6, v12, :cond_66

    const/4 v12, -0x1

    if-eq v7, v12, :cond_66

    .line 164
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v12, v12, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v12, v6}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v10

    .line 165
    .local v10, "viewF":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v12, v12, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    add-int/lit8 v13, v6, 0x1

    invoke-virtual {v12, v13}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v11

    .line 167
    .local v11, "viewFNext":Landroid/view/View;
    if-eqz v10, :cond_66

    if-eqz v11, :cond_66

    .line 168
    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v12

    if-gez v12, :cond_a3

    const/4 v8, 0x0

    .line 169
    .local v8, "topF":I
    :goto_45
    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    move-result v12

    if-gez v12, :cond_a8

    const/4 v1, 0x0

    .line 170
    .local v1, "bottomF":I
    :goto_4c
    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    move-result v12

    if-gez v12, :cond_ad

    const/4 v9, 0x0

    .line 171
    .local v9, "topFNext":I
    :goto_53
    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    move-result v12

    if-gez v12, :cond_b2

    const/4 v2, 0x0

    .line 173
    .local v2, "bottomFNext":I
    :goto_5a
    if-le v8, v1, :cond_b7

    sub-int v3, v8, v1

    .line 174
    .local v3, "heightF":I
    :goto_5e
    if-le v9, v2, :cond_ba

    sub-int v4, v9, v2

    .line 176
    .local v4, "heightFNext":I
    :goto_62
    if-le v4, v3, :cond_66

    .line 177
    add-int/lit8 v5, v6, 0x1

    .line 183
    .end local v1    # "bottomF":I
    .end local v2    # "bottomFNext":I
    .end local v3    # "heightF":I
    .end local v4    # "heightFNext":I
    .end local v8    # "topF":I
    .end local v9    # "topFNext":I
    .end local v10    # "viewF":Landroid/view/View;
    .end local v11    # "viewFNext":Landroid/view/View;
    :cond_66
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v12, v12, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_multiPageSectionalTextView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    iget-object v13, v13, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->_oneUpViewContext:Landroid/content/Context;

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    sget v14, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_asset_view_multi_page_numbering:I

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    add-int/lit8 v16, v5, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/multipage/AdobeAssetOneUpRecyclerViewController;->num_pages:I

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    .end local v5    # "pos":I
    .end local v6    # "posF":I
    .end local v7    # "posL":I
    :cond_a2
    return-void

    .line 168
    .restart local v5    # "pos":I
    .restart local v6    # "posF":I
    .restart local v7    # "posL":I
    .restart local v10    # "viewF":Landroid/view/View;
    .restart local v11    # "viewFNext":Landroid/view/View;
    :cond_a3
    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v8

    goto :goto_45

    .line 169
    .restart local v8    # "topF":I
    :cond_a8
    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    move-result v1

    goto :goto_4c

    .line 170
    .restart local v1    # "bottomF":I
    :cond_ad
    invoke-virtual {v11}, Landroid/view/View;->getTop()I

    move-result v9

    goto :goto_53

    .line 171
    .restart local v9    # "topFNext":I
    :cond_b2
    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    move-result v2

    goto :goto_5a

    .line 173
    .restart local v2    # "bottomFNext":I
    :cond_b7
    sub-int v3, v1, v8

    goto :goto_5e

    .line 174
    .restart local v3    # "heightF":I
    :cond_ba
    sub-int v4, v2, v9

    goto :goto_62
.end method
