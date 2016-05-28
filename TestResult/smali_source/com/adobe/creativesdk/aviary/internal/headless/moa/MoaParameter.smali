.class public abstract Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;
.super Ljava/lang/Object;
.source "MoaParameter.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3701e00f9277875bL


# instance fields
.field defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field description:Ljava/lang/String;

.field hasLimits:Z

.field maxValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field minValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field name:Ljava/lang/String;

.field type:Ljava/lang/String;

.field uid:Ljava/lang/String;

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;, "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract clone()Ljava/lang/Object;
.end method

.method public abstract encode()Ljava/lang/Object;
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;, "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter<TT;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;, "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter<TT;>;"
    .local p1, "newvalue":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;->value:Ljava/lang/Object;

    .line 81
    return-void
.end method
