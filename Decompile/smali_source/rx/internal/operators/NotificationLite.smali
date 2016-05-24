.class public final Lrx/internal/operators/NotificationLite;
.super Ljava/lang/Object;
.source "NotificationLite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/NotificationLite$OnErrorSentinel;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final INSTANCE:Lrx/internal/operators/NotificationLite;

.field private static final ON_COMPLETED_SENTINEL:Ljava/lang/Object;

.field private static final ON_NEXT_NULL_SENTINEL:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    new-instance v0, Lrx/internal/operators/NotificationLite;

    invoke-direct {v0}, Lrx/internal/operators/NotificationLite;-><init>()V

    sput-object v0, Lrx/internal/operators/NotificationLite;->INSTANCE:Lrx/internal/operators/NotificationLite;

    .line 54
    new-instance v0, Lrx/internal/operators/NotificationLite$1;

    invoke-direct {v0}, Lrx/internal/operators/NotificationLite$1;-><init>()V

    sput-object v0, Lrx/internal/operators/NotificationLite;->ON_COMPLETED_SENTINEL:Ljava/lang/Object;

    .line 63
    new-instance v0, Lrx/internal/operators/NotificationLite$2;

    invoke-direct {v0}, Lrx/internal/operators/NotificationLite$2;-><init>()V

    sput-object v0, Lrx/internal/operators/NotificationLite;->ON_NEXT_NULL_SENTINEL:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 38
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method public static instance()Lrx/internal/operators/NotificationLite;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/internal/operators/NotificationLite",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 51
    sget-object v0, Lrx/internal/operators/NotificationLite;->INSTANCE:Lrx/internal/operators/NotificationLite;

    return-object v0
.end method


# virtual methods
.method public accept(Lrx/Observer;Ljava/lang/Object;)Z
    .registers 7
    .param p2, "n"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observer",
            "<-TT;>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    .local p1, "o":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 139
    sget-object v2, Lrx/internal/operators/NotificationLite;->ON_COMPLETED_SENTINEL:Ljava/lang/Object;

    if-ne p2, v2, :cond_a

    .line 140
    invoke-interface {p1}, Lrx/Observer;->onCompleted()V

    .line 151
    .end local p2    # "n":Ljava/lang/Object;
    :goto_9
    return v0

    .line 142
    .restart local p2    # "n":Ljava/lang/Object;
    :cond_a
    sget-object v2, Lrx/internal/operators/NotificationLite;->ON_NEXT_NULL_SENTINEL:Ljava/lang/Object;

    if-ne p2, v2, :cond_14

    .line 143
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    move v0, v1

    .line 144
    goto :goto_9

    .line 145
    :cond_14
    if-eqz p2, :cond_2d

    .line 146
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    if-ne v2, v3, :cond_28

    .line 147
    check-cast p2, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    .end local p2    # "n":Ljava/lang/Object;
    # getter for: Lrx/internal/operators/NotificationLite$OnErrorSentinel;->e:Ljava/lang/Throwable;
    invoke-static {p2}, Lrx/internal/operators/NotificationLite$OnErrorSentinel;->access$000(Lrx/internal/operators/NotificationLite$OnErrorSentinel;)Ljava/lang/Throwable;

    move-result-object v1

    invoke-interface {p1, v1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_9

    .line 150
    .restart local p2    # "n":Ljava/lang/Object;
    :cond_28
    invoke-interface {p1, p2}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    move v0, v1

    .line 151
    goto :goto_9

    .line 153
    :cond_2d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The lite notification can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public completed()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 108
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    sget-object v0, Lrx/internal/operators/NotificationLite;->ON_COMPLETED_SENTINEL:Ljava/lang/Object;

    return-object v0
.end method

.method public error(Ljava/lang/Throwable;)Ljava/lang/Object;
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 121
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    new-instance v0, Lrx/internal/operators/NotificationLite$OnErrorSentinel;

    invoke-direct {v0, p1}, Lrx/internal/operators/NotificationLite$OnErrorSentinel;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public getValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "n"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 231
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    sget-object v0, Lrx/internal/operators/NotificationLite;->ON_NEXT_NULL_SENTINEL:Ljava/lang/Object;

    if-ne p1, v0, :cond_5

    const/4 p1, 0x0

    .end local p1    # "n":Ljava/lang/Object;
    :cond_5
    return-object p1
.end method

.method public isCompleted(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "n"    # Ljava/lang/Object;

    .prologue
    .line 165
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    sget-object v0, Lrx/internal/operators/NotificationLite;->ON_COMPLETED_SENTINEL:Ljava/lang/Object;

    if-ne p1, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public next(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "this":Lrx/internal/operators/NotificationLite;, "Lrx/internal/operators/NotificationLite<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_4

    .line 96
    sget-object p1, Lrx/internal/operators/NotificationLite;->ON_NEXT_NULL_SENTINEL:Ljava/lang/Object;

    .line 98
    .end local p1    # "t":Ljava/lang/Object;, "TT;"
    :cond_4
    return-object p1
.end method