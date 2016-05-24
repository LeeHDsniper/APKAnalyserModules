.class public abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;
.super Landroid/support/v7/app/ActionBarActivity;
.source "AdobeAssetShareBaseOneUpActivity.java"


# static fields
.field static _network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;


# instance fields
.field protected _rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

.field mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

.field mDummyLayout:Landroid/widget/FrameLayout;

.field mImagePath:Ljava/io/File;

.field mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

.field mOpenBtn:Landroid/view/View;

.field mOpenBtnContainer:Landroid/view/View;

.field mOpenFileText:Landroid/widget/TextView;

.field mPager:Landroid/support/v4/view/ViewPager;

.field private mPagerOnTouchListener:Landroid/view/View$OnTouchListener;

.field mPhotoNumber:Landroid/widget/TextView;

.field mPos:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivity;-><init>()V

    .line 67
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPagerOnTouchListener:Landroid/view/View$OnTouchListener;

    return-void
.end method

.method public static isNetworkAvailable()Z
    .registers 1

    .prologue
    .line 277
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    if-nez v0, :cond_a

    .line 278
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 280
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getCurrentIndex()I
    .registers 2

    .prologue
    .line 181
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPos:I

    return v0
.end method

.method abstract getItemPageChangeListener()Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
.end method

.method public getShadowRelativeLayout()Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    return-object v0
.end method

.method abstract getShareFile()Ljava/io/File;
.end method

.method public getShareIntent()Landroid/content/Intent;
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 160
    const/4 v1, 0x0

    .line 161
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getShareFile()Ljava/io/File;

    move-result-object v2

    .line 163
    .local v2, "renditionFile":Ljava/io/File;
    if-eqz v2, :cond_31

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 164
    new-instance v1, Landroid/content/Intent;

    .end local v1    # "intent":Landroid/content/Intent;
    const-string v3, "android.intent.action.SEND"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 165
    .restart local v1    # "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v3

    if-eqz v3, :cond_30

    .line 166
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getFileProvideAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, v2}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 167
    .local v0, "contentUri":Landroid/net/Uri;
    const-string v3, "image/*"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 168
    const-string v3, "android.intent.extra.STREAM"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 169
    invoke-virtual {v1, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 176
    .end local v0    # "contentUri":Landroid/net/Uri;
    :cond_30
    :goto_30
    return-object v1

    .line 173
    :cond_31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "Preview Not available, nothing to share"

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    .line 174
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_30
.end method

.method public getSlidingUpPanel()Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    return-object v0
.end method

.method protected hideOrShowBaseActivityActionsBar()V
    .registers 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 111
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 112
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v3

    .line 113
    .local v3, "hasMenuKey":Z
    const/4 v5, 0x4

    invoke-static {v5}, Landroid/view/KeyCharacterMap;->deviceHasKey(I)Z

    move-result v2

    .line 115
    .local v2, "hasBackKey":Z
    if-eqz v0, :cond_63

    .line 116
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->isShowing()Z

    move-result v5

    if-eqz v5, :cond_64

    .line 117
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->hide()V

    .line 118
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v5, v8, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 119
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mOpenBtnContainer:Landroid/view/View;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    .line 120
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->updateSelectionBtnVisibility(Z)V

    .line 121
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$color;->asset_detail_blackBackGround:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setBackgroundColor(I)V

    .line 122
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v8, v8, v8, v8}, Landroid/support/v4/view/ViewPager;->setPadding(IIII)V

    .line 126
    const/4 v4, 0x0

    .line 127
    .local v4, "uiOptions":I
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_52

    .line 128
    or-int/lit8 v4, v4, 0x4

    .line 130
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x13

    if-lt v5, v6, :cond_52

    .line 131
    or-int/lit16 v4, v4, 0x800

    .line 135
    :cond_52
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 136
    .local v1, "decorView":Landroid/view/View;
    if-nez v3, :cond_60

    if-nez v2, :cond_60

    .line 137
    or-int/lit16 v4, v4, 0x702

    .line 139
    :cond_60
    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 156
    .end local v1    # "decorView":Landroid/view/View;
    .end local v4    # "uiOptions":I
    :cond_63
    :goto_63
    return-void

    .line 142
    :cond_64
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->show()V

    .line 143
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {v5, v6, v8}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowVisible(ZZ)V

    .line 144
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->updateOpenBtnContainerVisibility()V

    .line 145
    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->updateSelectionBtnVisibility(Z)V

    .line 147
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$color;->creative_sdk_background_color:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setBackgroundColor(I)V

    .line 148
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getHeight()I

    move-result v6

    invoke-virtual {v5, v8, v6, v8, v8}, Landroid/support/v4/view/ViewPager;->setPadding(IIII)V

    .line 150
    const/4 v4, 0x0

    .line 151
    .restart local v4    # "uiOptions":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 153
    .restart local v1    # "decorView":Landroid/view/View;
    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_63
.end method

.method public onBackPressed()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 249
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    invoke-virtual {v1}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->getVisibility()I

    move-result v1

    if-nez v1, :cond_27

    .line 250
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v2, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->COLLAPSED:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v1, v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setPanelState(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)V

    .line 251
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setVisibility(I)V

    .line 252
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->shareList:I

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 253
    .local v0, "view":Landroid/widget/ListView;
    if-eqz v0, :cond_26

    .line 254
    invoke-virtual {v0, v3}, Landroid/widget/ListView;->smoothScrollToPosition(I)V

    .line 255
    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setClickable(Z)V

    .line 262
    .end local v0    # "view":Landroid/widget/ListView;
    :cond_26
    :goto_26
    return-void

    .line 261
    :cond_27
    invoke-super {p0}, Landroid/support/v7/app/ActionBarActivity;->onBackPressed()V

    goto :goto_26
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 186
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 188
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_library_item_collection_activity:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->setContentView(I)V

    .line 190
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_oneup_rootview:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    .line 191
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_rootShadowRelativeLayout:Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/foundation/assets/R$dimen;->ActionBar_Size:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->setShadowTopOffset(I)V

    .line 194
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->actionbar_toolbar:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/Toolbar;

    .line 195
    .local v1, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 196
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 197
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 198
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    const/16 v3, 0xe

    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(I)V

    .line 200
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_pager:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    .line 202
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getItemPageChangeListener()Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 204
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 205
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_60

    .line 206
    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 209
    :cond_60
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPagerOnTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 212
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPager:Landroid/support/v4/view/ViewPager;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDepthPageTransformer;

    invoke-direct {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDepthPageTransformer;-><init>()V

    invoke-virtual {v2, v5, v3}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 214
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_open_button_container:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mOpenBtnContainer:Landroid/view/View;

    .line 215
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_selection_open_file_btn:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mOpenBtn:Landroid/view/View;

    .line 216
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_photo_number:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mPhotoNumber:Landroid/widget/TextView;

    .line 217
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_selection_open_file_text:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mOpenFileText:Landroid/widget/TextView;

    .line 219
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->updateOpenBtnContainerVisibility()V

    .line 221
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    if-nez v2, :cond_a2

    .line 222
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    move-result-object v2

    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 225
    :cond_a2
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->dummy_framelayout:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mDummyLayout:Landroid/widget/FrameLayout;

    .line 227
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->sliding_layout:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    .line 229
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mDummyLayout:Landroid/widget/FrameLayout;

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$2;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 237
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setVisibility(I)V

    .line 238
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mLayout:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;

    sget-object v3, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;->HIDDEN:Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;

    invoke-virtual {v2, v3}, Lcom/sothree/slidinguppanel/SlidingUpPanelLayout;->setPanelState(Lcom/sothree/slidinguppanel/SlidingUpPanelLayout$PanelState;)V

    .line 240
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "adobeassetviewerimages"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mImagePath:Ljava/io/File;

    .line 241
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mImagePath:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_e7

    .line 243
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->mImagePath:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 245
    :cond_e7
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 267
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_e

    .line 268
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onBackPressed()V

    .line 269
    const/4 v0, 0x1

    .line 271
    :goto_d
    return v0

    :cond_e
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_d
.end method

.method setActionBarTitle(Ljava/lang/String;)V
    .registers 3
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 106
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method abstract updateOpenBtnContainerVisibility()V
.end method

.method abstract updateSelectionBtnVisibility(Z)V
.end method
