.class public Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;
.super Landroid/support/v4/app/Fragment;
.source "ListFragmentAbstract.java"


# static fields
.field static final INTERNAL_EMPTY_ID:I

.field static final INTERNAL_LIST_CONTAINER_ID:I

.field static final INTERNAL_PROGRESS_CONTAINER_ID:I


# instance fields
.field mAdapter:Landroid/widget/ListAdapter;

.field mEmptyText:Ljava/lang/CharSequence;

.field mEmptyView:Landroid/view/View;

.field private final mHandler:Landroid/os/Handler;

.field mList:Landroid/widget/ListView;

.field mListContainer:Landroid/view/View;

.field mListShown:Z

.field private final mOnClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field mProgressContainer:Landroid/view/View;

.field private final mRequestFocus:Ljava/lang/Runnable;

.field mStandardEmptyView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 25
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->empty:I

    sput v0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->INTERNAL_EMPTY_ID:I

    .line 26
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->progress_container:I

    sput v0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->INTERNAL_PROGRESS_CONTAINER_ID:I

    .line 27
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->list_container:I

    sput v0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->INTERNAL_LIST_CONTAINER_ID:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 28
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mHandler:Landroid/os/Handler;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mRequestFocus:Ljava/lang/Runnable;

    .line 34
    new-instance v0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$2;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$2;-><init>(Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mOnClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 49
    return-void
.end method

.method private ensureList()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 263
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    if-eqz v3, :cond_6

    .line 314
    :goto_5
    return-void

    .line 266
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getView()Landroid/view/View;

    move-result-object v2

    .line 267
    .local v2, "root":Landroid/view/View;
    if-nez v2, :cond_14

    .line 268
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Content view not yet created"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 270
    :cond_14
    instance-of v3, v2, Landroid/widget/ListView;

    if-eqz v3, :cond_3a

    .line 271
    check-cast v2, Landroid/widget/ListView;

    .end local v2    # "root":Landroid/view/View;
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    .line 300
    :cond_1c
    :goto_1c
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListShown:Z

    .line 301
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mOnClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 302
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v3, :cond_aa

    .line 303
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mAdapter:Landroid/widget/ListAdapter;

    .line 304
    .local v0, "adapter":Landroid/widget/ListAdapter;
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mAdapter:Landroid/widget/ListAdapter;

    .line 305
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 313
    .end local v0    # "adapter":Landroid/widget/ListAdapter;
    :cond_32
    :goto_32
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mHandler:Landroid/os/Handler;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5

    .line 273
    .restart local v2    # "root":Landroid/view/View;
    :cond_3a
    sget v3, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->INTERNAL_EMPTY_ID:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mStandardEmptyView:Landroid/widget/TextView;

    .line 274
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mStandardEmptyView:Landroid/widget/TextView;

    if-nez v3, :cond_76

    .line 275
    const v3, 0x1020004

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mEmptyView:Landroid/view/View;

    .line 279
    :goto_51
    sget v3, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->INTERNAL_PROGRESS_CONTAINER_ID:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    .line 280
    sget v3, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->INTERNAL_LIST_CONTAINER_ID:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    .line 281
    const v3, 0x102000a

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 282
    .local v1, "rawListView":Landroid/view/View;
    instance-of v3, v1, Landroid/widget/ListView;

    if-nez v3, :cond_86

    .line 283
    if-nez v1, :cond_7e

    .line 284
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Your content must have a ListView whose id attribute is \'android.R.id.list\'"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 277
    .end local v1    # "rawListView":Landroid/view/View;
    :cond_76
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mStandardEmptyView:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_51

    .line 288
    .restart local v1    # "rawListView":Landroid/view/View;
    :cond_7e
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Content has view with id attribute \'android.R.id.list\' that is not a ListView class"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 292
    :cond_86
    check-cast v1, Landroid/widget/ListView;

    .end local v1    # "rawListView":Landroid/view/View;
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    .line 293
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mEmptyView:Landroid/view/View;

    if-eqz v3, :cond_96

    .line 294
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mEmptyView:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    goto :goto_1c

    .line 295
    :cond_96
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mEmptyText:Ljava/lang/CharSequence;

    if-eqz v3, :cond_1c

    .line 296
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mStandardEmptyView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mEmptyText:Ljava/lang/CharSequence;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mStandardEmptyView:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    goto/16 :goto_1c

    .line 309
    .end local v2    # "root":Landroid/view/View;
    :cond_aa
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    if-eqz v3, :cond_32

    .line 310
    invoke-direct {p0, v5, v5}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->setListShown(ZZ)V

    goto :goto_32
.end method

.method private setListShown(ZZ)V
    .registers 9
    .param p1, "shown"    # Z
    .param p2, "animate"    # Z

    .prologue
    const v5, 0x10a0001

    const/high16 v4, 0x10a0000

    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 216
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->ensureList()V

    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    if-nez v0, :cond_17

    .line 218
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t be used with a custom content view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_17
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListShown:Z

    if-ne v0, p1, :cond_1c

    .line 253
    :goto_1b
    return-void

    .line 223
    :cond_1c
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListShown:Z

    .line 224
    if-eqz p1, :cond_52

    .line 225
    if-eqz p2, :cond_47

    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    .line 228
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 227
    invoke-static {v1, v5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 226
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    .line 231
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 230
    invoke-static {v1, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 229
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 236
    :goto_3c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1b

    .line 233
    :cond_47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 234
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    goto :goto_3c

    .line 239
    :cond_52
    if-eqz p2, :cond_79

    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    .line 242
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 241
    invoke-static {v1, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 240
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    .line 245
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 244
    invoke-static {v1, v5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 243
    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 250
    :goto_6e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 251
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1b

    .line 247
    :cond_79
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 248
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    goto :goto_6e
.end method


# virtual methods
.method public getListView()Landroid/widget/ListView;
    .registers 2

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->ensureList()V

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 70
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_listfragment:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mRequestFocus:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 88
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    .line 89
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListShown:Z

    .line 90
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mEmptyView:Landroid/view/View;

    .line 91
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mProgressContainer:Landroid/view/View;

    .line 92
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListContainer:Landroid/view/View;

    .line 93
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mStandardEmptyView:Landroid/widget/TextView;

    .line 94
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 95
    return-void
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .registers 6
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 109
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 78
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->ensureList()V

    .line 80
    return-void
.end method

.method public setListAdapter(Landroid/widget/ListAdapter;)V
    .registers 6
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 115
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v3, :cond_27

    move v0, v1

    .line 116
    .local v0, "hadAdapter":Z
    :goto_7
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mAdapter:Landroid/widget/ListAdapter;

    .line 117
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    if-eqz v3, :cond_26

    .line 118
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    invoke-virtual {v3, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 119
    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mListShown:Z

    if-nez v3, :cond_26

    if-nez v0, :cond_26

    .line 122
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    if-eqz v3, :cond_23

    move v2, v1

    :cond_23
    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->setListShown(ZZ)V

    .line 125
    :cond_26
    return-void

    .end local v0    # "hadAdapter":Z
    :cond_27
    move v0, v2

    .line 115
    goto :goto_7
.end method

.method public setListShown(Z)V
    .registers 3
    .param p1, "shown"    # Z

    .prologue
    .line 194
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->setListShown(ZZ)V

    .line 195
    return-void
.end method
