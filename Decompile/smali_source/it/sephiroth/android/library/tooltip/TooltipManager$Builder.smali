.class public final Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
.super Ljava/lang/Object;
.source "TooltipManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/tooltip/TooltipManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field actionbarSize:I

.field activateDelay:J

.field closeCallback:Lit/sephiroth/android/library/tooltip/TooltipManager$onTooltipClosingCallback;

.field closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

.field defStyleAttr:I

.field defStyleRes:I

.field fadeDuration:J

.field gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field hideArrow:Z

.field id:I

.field isCustomView:Z

.field manager:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lit/sephiroth/android/library/tooltip/TooltipManager;",
            ">;"
        }
    .end annotation
.end field

.field maxWidth:I

.field point:Landroid/graphics/Point;

.field restrictToScreenEdges:Z

.field showDelay:J

.field showDuration:J

.field text:Ljava/lang/CharSequence;

.field textResId:I

.field view:Landroid/view/View;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/tooltip/TooltipManager;I)V
    .registers 7
    .param p1, "manager"    # Lit/sephiroth/android/library/tooltip/TooltipManager;
    .param p2, "id"    # I

    .prologue
    const-wide/16 v2, 0x0

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    const/4 v0, 0x0

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->actionbarSize:I

    .line 224
    sget v0, Lit/sephiroth/android/library/tooltip/R$layout;->tooltip_textview:I

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->textResId:I

    .line 229
    iput-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->showDelay:J

    .line 231
    const/4 v0, -0x1

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->maxWidth:I

    .line 232
    sget v0, Lit/sephiroth/android/library/tooltip/R$style;->ToolTipLayoutDefaultStyle:I

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleRes:I

    .line 233
    sget v0, Lit/sephiroth/android/library/tooltip/R$attr;->ttlm_defaultStyle:I

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleAttr:I

    .line 234
    iput-wide v2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->activateDelay:J

    .line 236
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->restrictToScreenEdges:Z

    .line 237
    const-wide/16 v0, 0xc8

    iput-wide v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->fadeDuration:J

    .line 241
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->manager:Ljava/lang/ref/WeakReference;

    .line 242
    iput p2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->id:I

    .line 243
    return-void
.end method


# virtual methods
.method public actionBarSize(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 2
    .param p1, "actionBarSize"    # I

    .prologue
    .line 333
    iput p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->actionbarSize:I

    .line 334
    return-object p0
.end method

.method public anchor(Landroid/graphics/Point;Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 4
    .param p1, "point"    # Landroid/graphics/Point;
    .param p2, "gravity"    # Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .prologue
    .line 317
    const/4 v0, 0x0

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->view:Landroid/view/View;

    .line 318
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->point:Landroid/graphics/Point;

    .line 319
    iput-object p2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 320
    return-object p0
.end method

.method public closePolicy(Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;J)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 4
    .param p1, "policy"    # Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;
    .param p2, "milliseconds"    # J

    .prologue
    .line 342
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    .line 343
    iput-wide p2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->showDuration:J

    .line 344
    return-object p0
.end method

.method public maxWidth(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 2
    .param p1, "maxWidth"    # I

    .prologue
    .line 305
    iput p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->maxWidth:I

    .line 306
    return-object p0
.end method

.method public show()Z
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 359
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->closePolicy:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    if-nez v1, :cond_d

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "ClosePolicy cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 360
    :cond_d
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->point:Landroid/graphics/Point;

    if-nez v1, :cond_1d

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->view:Landroid/view/View;

    if-nez v1, :cond_1d

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Target point or target view must be specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 361
    :cond_1d
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v2, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->CENTER:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v1, v2, :cond_25

    iput-boolean v3, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->hideArrow:Z

    .line 363
    :cond_25
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->manager:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/tooltip/TooltipManager;

    .line 364
    .local v0, "tmanager":Lit/sephiroth/android/library/tooltip/TooltipManager;
    if-eqz v0, :cond_34

    .line 365
    # invokes: Lit/sephiroth/android/library/tooltip/TooltipManager;->show(Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;Z)Z
    invoke-static {v0, p0, v3}, Lit/sephiroth/android/library/tooltip/TooltipManager;->access$200(Lit/sephiroth/android/library/tooltip/TooltipManager;Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;Z)Z

    move-result v1

    .line 367
    :goto_33
    return v1

    :cond_34
    const/4 v1, 0x0

    goto :goto_33
.end method

.method public showDelay(J)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 4
    .param p1, "ms"    # J

    .prologue
    .line 353
    iput-wide p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->showDelay:J

    .line 354
    return-object p0
.end method

.method public text(Landroid/content/res/Resources;I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 4
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "resid"    # I

    .prologue
    .line 286
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->text(Ljava/lang/CharSequence;)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/CharSequence;)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 300
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->text:Ljava/lang/CharSequence;

    .line 301
    return-object p0
.end method

.method public toggleArrow(Z)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 3
    .param p1, "show"    # Z

    .prologue
    .line 328
    if-nez p1, :cond_6

    const/4 v0, 0x1

    :goto_3
    iput-boolean v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->hideArrow:Z

    .line 329
    return-object p0

    .line 328
    :cond_6
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public withCustomView(IZ)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 3
    .param p1, "resId"    # I
    .param p2, "replace_background"    # Z

    .prologue
    .line 255
    iput p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->textResId:I

    .line 256
    iput-boolean p2, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->isCustomView:Z

    .line 257
    return-object p0
.end method

.method public withStyleId(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;
    .registers 3
    .param p1, "styleId"    # I

    .prologue
    .line 265
    const/4 v0, 0x0

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleAttr:I

    .line 266
    iput p1, p0, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleRes:I

    .line 267
    return-object p0
.end method
