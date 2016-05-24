.class public Lcom/adobe/creativesdk/aviary/ToolBarActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "ToolBarActivity.java"


# instance fields
.field private mToolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getToolbar()Landroid/support/v7/widget/Toolbar;
    .registers 2

    .prologue
    .line 19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->mToolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method public onContentChanged()V
    .registers 2

    .prologue
    .line 13
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onContentChanged()V

    .line 14
    sget v0, Lcom/aviary/android/feather/sdk/R$id;->toolbar:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 15
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 16
    return-void
.end method
