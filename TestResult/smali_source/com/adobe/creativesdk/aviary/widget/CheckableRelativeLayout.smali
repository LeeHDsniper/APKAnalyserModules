.class public Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;
.super Landroid/widget/RelativeLayout;
.source "CheckableRelativeLayout.java"

# interfaces
.implements Landroid/widget/Checkable;


# static fields
.field private static final CHECKED_STATE_SET:[I


# instance fields
.field private checked:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 10
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a0

    aput v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->CHECKED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 9
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 9
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    .line 22
    return-void
.end method


# virtual methods
.method public isChecked()Z
    .registers 2

    .prologue
    .line 35
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    return v0
.end method

.method protected onCreateDrawableState(I)[I
    .registers 4
    .param p1, "extraSpace"    # I

    .prologue
    .line 26
    add-int/lit8 v1, p1, 0x1

    invoke-super {p0, v1}, Landroid/widget/RelativeLayout;->onCreateDrawableState(I)[I

    move-result-object v0

    .line 27
    .local v0, "drawableState":[I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 28
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->CHECKED_STATE_SET:[I

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->mergeDrawableStates([I[I)[I

    .line 30
    :cond_11
    return-object v0
.end method

.method public setChecked(Z)V
    .registers 3
    .param p1, "checked"    # Z

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    if-eq p1, v0, :cond_9

    .line 41
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    .line 42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->refreshDrawableState()V

    .line 44
    :cond_9
    return-void
.end method

.method public toggle()V
    .registers 2

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->checked:Z

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_5
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/CheckableRelativeLayout;->setChecked(Z)V

    .line 49
    return-void

    .line 48
    :cond_9
    const/4 v0, 0x0

    goto :goto_5
.end method
