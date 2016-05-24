.class abstract Lcom/facebook/model/GraphObject$Factory$ProxyBase;
.super Ljava/lang/Object;
.source "GraphObject.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/model/GraphObject$Factory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "ProxyBase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<STATE:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/reflect/InvocationHandler;"
    }
.end annotation


# static fields
.field private static final EQUALS_METHOD:Ljava/lang/String; = "equals"

.field private static final TOSTRING_METHOD:Ljava/lang/String; = "toString"


# instance fields
.field protected final state:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TSTATE;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSTATE;)V"
        }
    .end annotation

    .prologue
    .line 443
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$ProxyBase;, "Lcom/facebook/model/GraphObject$Factory$ProxyBase<TSTATE;>;"
    .local p1, "state":Ljava/lang/Object;, "TSTATE;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 444
    iput-object p1, p0, Lcom/facebook/model/GraphObject$Factory$ProxyBase;->state:Ljava/lang/Object;

    .line 445
    return-void
.end method


# virtual methods
.method protected final proxyObjectMethods(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$ProxyBase;, "Lcom/facebook/model/GraphObject$Factory$ProxyBase<TSTATE;>;"
    const/4 v5, 0x0

    .line 454
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    .line 455
    .local v1, "methodName":Ljava/lang/String;
    const-string v4, "equals"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 456
    aget-object v2, p3, v5

    .line 458
    .local v2, "other":Ljava/lang/Object;
    if-nez v2, :cond_16

    .line 459
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 473
    .end local v2    # "other":Ljava/lang/Object;
    :goto_15
    return-object v4

    .line 462
    .restart local v2    # "other":Ljava/lang/Object;
    :cond_16
    invoke-static {v2}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v0

    .line 463
    .local v0, "handler":Ljava/lang/reflect/InvocationHandler;
    instance-of v4, v0, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;

    if-nez v4, :cond_23

    .line 464
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_15

    :cond_23
    move-object v3, v0

    .line 466
    check-cast v3, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;

    .line 467
    .local v3, "otherProxy":Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
    iget-object v4, p0, Lcom/facebook/model/GraphObject$Factory$ProxyBase;->state:Ljava/lang/Object;

    iget-object v5, v3, Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;->state:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_15

    .line 468
    .end local v0    # "handler":Ljava/lang/reflect/InvocationHandler;
    .end local v2    # "other":Ljava/lang/Object;
    .end local v3    # "otherProxy":Lcom/facebook/model/GraphObject$Factory$GraphObjectProxy;
    :cond_33
    const-string v4, "toString"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 469
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_15

    .line 473
    :cond_40
    iget-object v4, p0, Lcom/facebook/model/GraphObject$Factory$ProxyBase;->state:Ljava/lang/Object;

    invoke-virtual {p2, v4, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto :goto_15
.end method

.method protected final throwUnexpectedMethodSignature(Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 5
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 449
    .local p0, "this":Lcom/facebook/model/GraphObject$Factory$ProxyBase;, "Lcom/facebook/model/GraphObject$Factory$ProxyBase<TSTATE;>;"
    new-instance v0, Lcom/facebook/FacebookGraphObjectException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " got an unexpected method signature: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 450
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 449
    invoke-direct {v0, v1}, Lcom/facebook/FacebookGraphObjectException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
