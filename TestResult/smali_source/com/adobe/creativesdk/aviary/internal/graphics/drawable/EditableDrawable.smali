.class public interface abstract Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
.super Ljava/lang/Object;
.source "EditableDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;
    }
.end annotation


# virtual methods
.method public abstract beginEdit()V
.end method

.method public abstract endEdit()V
.end method

.method public abstract getStrokeEnabled()Z
.end method

.method public abstract getText()Ljava/lang/CharSequence;
.end method

.method public abstract getTextColor()I
.end method

.method public abstract getTextSize()F
.end method

.method public abstract getTextStrokeColor()I
.end method

.method public abstract isEditing()Z
.end method

.method public abstract isTextHint()Z
.end method

.method public abstract setBounds(FFFF)V
.end method

.method public abstract setOnSizeChangeListener(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;)V
.end method

.method public abstract setText(Ljava/lang/CharSequence;)V
.end method

.method public abstract setText(Ljava/lang/String;)V
.end method

.method public abstract setTextColor(I)V
.end method
