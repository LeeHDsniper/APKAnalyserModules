.class public Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;
.super Landroid/support/v4/app/Fragment;
.source "CanvasFragment.java"


# instance fields
.field private mImageNum:I

.field private mImageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method public static newInstance(I)Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;
    .registers 4
    .param p0, "imageNum"    # I

    .prologue
    .line 19
    new-instance v1, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;

    invoke-direct {v1}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;-><init>()V

    .line 20
    .local v1, "f":Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 21
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "resId"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 22
    invoke-virtual {v1, v0}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->setArguments(Landroid/os/Bundle;)V

    .line 23
    return-object v1
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 45
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 46
    const-class v1, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    .line 47
    sget-object v1, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->imageResIds:[Ljava/lang/Integer;

    iget v2, p0, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->mImageNum:I

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 48
    .local v0, "resId":I
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    check-cast v1, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    iget-object v2, p0, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v1, v0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;->loadBitmap(ILandroid/widget/ImageView;)V

    .line 50
    .end local v0    # "resId":I
    :cond_24
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 32
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "resId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    :goto_13
    iput v0, p0, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->mImageNum:I

    .line 33
    return-void

    .line 32
    :cond_16
    const/4 v0, -0x1

    goto :goto_13
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 38
    const v1, 0x7f0300ea

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 39
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f0f00ca

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->mImageView:Landroid/widget/ImageView;

    .line 40
    return-object v0
.end method
