import PageLayout from "./components/standard-layout";

// Individual pages
import IndexPage from "./pages/landing-page";

const Routes = {
  "/list": {
    render: function () {
      return m(Layout, m(nodeList));
    },
  },
  "/new": {
    render: function () {
      return m(Layout, m(addNode));
    },
  },
  "/edit/:id": {
    render: function (vnode) {
      return m(Layout, m(editNode, vnode.attrs));
    },
  },
  "/test": {
    render: function () {
      return m(PageLayout, m(IndexPage));
    },
  },
};

const DefaultRoute = "/test";

export { Routes, DefaultRoute };