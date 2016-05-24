.class public abstract Lcom/nineoldandroids/animation/Animator;
.super Ljava/lang/Object;
.source "Animator.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    }
.end annotation


# instance fields
.field mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    .line 247
    return-void
.end method


# virtual methods
.method public addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    .line 148
    :cond_b
    iget-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    return-void
.end method

.method public cancel()V
    .registers 1

    .prologue
    .line 61
    return-void
.end method

.method public clone()Lcom/nineoldandroids/animation/Animator;
    .registers 8

    .prologue
    .line 192
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/Animator;

    .line 193
    .local v0, "anim":Lcom/nineoldandroids/animation/Animator;
    iget-object v5, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    if-eqz v5, :cond_2d

    .line 194
    iget-object v4, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    .line 195
    .local v4, "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    .line 196
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 197
    .local v3, "numListeners":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    if-ge v2, v3, :cond_2d

    .line 198
    iget-object v5, v0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_23
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_23} :catch_26

    .line 197
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 202
    .end local v0    # "anim":Lcom/nineoldandroids/animation/Animator;
    .end local v2    # "i":I
    .end local v3    # "numListeners":I
    .end local v4    # "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :catch_26
    move-exception v1

    .line 203
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5}, Ljava/lang/AssertionError;-><init>()V

    throw v5

    .line 201
    .end local v1    # "e":Ljava/lang/CloneNotSupportedException;
    .restart local v0    # "anim":Lcom/nineoldandroids/animation/Animator;
    :cond_2d
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Animator;->clone()Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    return-object v0
.end method

.method public getListeners()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    return-object v0
.end method

.method public abstract isRunning()Z
.end method

.method public isStarted()Z
    .registers 2

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/Animator;->isRunning()Z

    move-result v0

    return v0
.end method

.method public removeListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    if-nez v0, :cond_5

    .line 165
    :cond_4
    :goto_4
    return-void

    .line 161
    :cond_5
    iget-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 162
    iget-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_4

    .line 163
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nineoldandroids/animation/Animator;->mListeners:Ljava/util/ArrayList;

    goto :goto_4
.end method

.method public abstract setDuration(J)Lcom/nineoldandroids/animation/Animator;
.end method

.method public abstract setInterpolator(Landroid/view/animation/Interpolator;)V
.end method

.method public abstract setStartDelay(J)V
.end method

.method public start()V
    .registers 1

    .prologue
    .line 49
    return-void
.end method
