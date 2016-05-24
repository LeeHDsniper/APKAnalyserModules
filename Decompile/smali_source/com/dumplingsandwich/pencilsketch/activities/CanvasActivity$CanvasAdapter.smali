.class Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;
.source "CanvasActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CanvasAdapter"
.end annotation


# instance fields
.field private final mSize:I

.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;


# direct methods
.method public constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;Landroid/support/v4/app/FragmentManager;I)V
    .registers 4
    .param p2, "fm"    # Landroid/support/v4/app/FragmentManager;
    .param p3, "size"    # I

    .prologue
    .line 176
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity;

    .line 177
    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 178
    iput p3, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;->mSize:I

    .line 179
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 183
    iget v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/CanvasActivity$CanvasAdapter;->mSize:I

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 188
    invoke-static {p1}, Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;->newInstance(I)Lcom/dumplingsandwich/pencilsketch/fragment/CanvasFragment;

    move-result-object v0

    return-object v0
.end method
